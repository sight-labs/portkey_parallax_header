class ExampleTableViewController < UIViewController
  def viewDidLoad
    super
    self.view.addSubview(table_view)
    table_view.add_portkey_parallax_with_view(image_view, height: 320, shadow: false, min_height: 64)
  end

  def tableView(table_view, numberOfRowsInSection: section)
    100
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    cell = table_view.dequeueReusableCellWithIdentifier('Cell')
    if cell.nil?
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: 'Cell')
    end
    cell.textLabel.text = "Row #{index_path.row + 1}"
    cell
  end

  def header_view
    @header_view ||= UIView.alloc.init.tap do |view|
      view.backgroundColor = UIColor.brownColor
    end
  end

  def image_view
    @image_view ||= UIImageView.alloc.initWithImage(UIImage.imageNamed('image.jpg')).tap do |view|
      view.setContentMode(UIViewContentModeScaleAspectFill)
    end
  end

  def table_view
    @table_view ||= UITableView.alloc.initWithFrame(self.view.bounds, style: UITableViewStylePlain).tap do |table|
      table.delegate = self
      table.dataSource = self
      table.backgroundColor = UIColor.blueColor
      table.alwaysBounceVertical = true
    end
  end
end
