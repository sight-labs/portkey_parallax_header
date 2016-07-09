class ExampleCollectionViewCell < UICollectionViewCell
  IDENTIFIER = 'Cell'

  def initWithFrame(frame)
    super.tap do
      self.contentView.addSubview(text_label)
      self.backgroundColor = UIColor.whiteColor
    end
  end

  def text_label
    @text_label ||= UILabel.alloc.initWithFrame(self.contentView.bounds).tap do |label|
      label.textAlignment = UITextAlignmentCenter
    end
  end
end
