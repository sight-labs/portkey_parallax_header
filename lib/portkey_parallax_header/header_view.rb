module PortkeyParallaxHeader
  class HeaderView < UIView
    attr_accessor :state, :scroll_view, :custom_view, :parallax_height,
      :parallax_min_height, :is_observing, :content_offset_context, :delegate

    def init_with_frame(frame, custom_view: view, scroll_view: scroll_view, height: height, min_height: min_height)
      self.initWithFrame(frame).tap do
        self.autoresizingMask    = UIViewAutoresizingFlexibleHeight
        self.clipsToBounds       = true
        self.scroll_view         = scroll_view
        self.parallax_height     = height
        self.parallax_min_height = min_height
        self.state               = :tracking_active
        self.custom_view = view
        add_scroll_view_offset_observer
      end
    end

    def add_scroll_view_offset_observer
      if !is_observing
        @content_offset_context = Pointer.new(:char)
        scroll_view.addObserver(self, forKeyPath: 'contentOffset', options: NSKeyValueObservingOptionNew, context: content_offset_context)
        @is_observing = true
        @content_offset_context = content_offset_context
      end
    end

    def willMoveToSuperview(new_superview)
      if self.superview & new_superview.nil?
        scroll_view = self.superview
        scroll_view.removeObserver(self, forKeyPath: 'contentOffset')
        @is_observing = false
      end
    end

    def custom_view=(view)
      if custom_view
        custom_view.removeFromSuperview
      end

      @custom_view = view
      addSubview(view)

      custom_view.setTranslatesAutoresizingMaskIntoConstraints(false)
      self.addConstraints(
        NSLayoutConstraint.constraintsWithVisualFormat(
          'V:|[custom_view]|',
          options: 0,
          metrics: nil,
          views: { 'custom_view' => custom_view }
        )
      )
      self.addConstraints(
        NSLayoutConstraint.constraintsWithVisualFormat(
          'H:|[custom_view]|',
          options: 0,
          metrics: nil,
          views: { 'custom_view' => custom_view }
        )
      )
    end

    def observeValueForKeyPath(key_path, ofObject: object, change: change, context: context)
      if context[0] == content_offset_context[0]
        scrollViewDidScroll(change[NSKeyValueChangeNewKey].CGPointValue)
      end
    end

    def scrollViewDidScroll(content_offset)
      # We do not want to track when the parallax view is hidden
      if content_offset.y > 0 && parallax_min_height == 0
        @state = :tracking_inactive
      else
        @state = :tracking_active
      end

  	   if state == :tracking_active
        # Resize/reposition the parallaxView based on the content offset
        y_offset = content_offset.y * -1
        height   = [parallax_min_height, y_offset].max

        max_height = parallax_height
        min_height = parallax_min_height
        progress   = (height - min_height).to_f / (max_height - min_height).to_f

        if delegate && delegate.respond_to?('portkey_parallax_header:progress:')
          delegate.portkey_parallax_header(WeakRef.new(self), progress: progress)
        end

        self.setFrame(CGRectMake(0, content_offset.y, CGRectGetWidth(self.frame), height))

        # Correct the scroll indicator position
        # Without this the scroll indicator will be displayed on top of the parallax view
        if scroll_view.contentOffset.y < -parallax_height
          scroll_view.setScrollIndicatorInsets(UIEdgeInsetsMake(scroll_view.contentInset.top + (scroll_view.contentOffset.y.abs - parallax_height), 0, 0, 0))
        else
          scroll_view.setScrollIndicatorInsets(UIEdgeInsetsMake(scroll_view.contentInset.top, 0, 0, 0))
        end
      end
    end
  end
end
