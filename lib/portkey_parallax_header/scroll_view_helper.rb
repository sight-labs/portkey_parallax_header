class UIScrollView
  attr_reader :portkey_parallax_header, :shows_parallax

  # @param [UIView] view, the view being added
  # @param [Float] height, the height of the parallax header
  def add_portkey_parallax_with_view(view, height: height)
    add_portkey_parallax_with_view(view, height: height, min_height: 0)
  end

  # @param [UIView] view, the view being added
  # @param [Float] height, the height of the parallax header
  # @param [Float] min_height, the minimum height of the header when scrolling up
  def add_portkey_parallax_with_view(view, height: height, min_height: min_height)
    if portkey_parallax_header
      portkey_parallax_header.remove_custom_view
      view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight
      portkey_parallax_header.custom_view = view
    else
      @portkey_parallax_header = PortkeyParallaxHeader::HeaderView.alloc.init_with_frame(
        CGRectMake(0, 0, self.bounds.size.width, height),
        custom_view: view,
        scroll_view: WeakRef.new(self),
        height:      height,
        min_height:  min_height
      )
      portkey_parallax_header.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight
      portkey_parallax_header.backgroundColor = UIColor.clearColor
      self.addSubview(portkey_parallax_header)
      new_inset           = self.contentInset
      new_inset.top       = height
      self.contentInset   = new_inset
    end
  end

  def portkey_parallax_header_delegate= delegate

    raise 'Add view to portkey_parallax_header before adding a delegate' unless portkey_parallax_header
    portkey_parallax_header.delegate = delegate
  end

  def didMoveToSuperview
    super
  end
end
