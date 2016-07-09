class ExampleCollectionViewController < UIViewController
  def viewDidLoad
    super
    self.view.addSubview(collection_view)
    register_cells
    collection_view.add_portkey_parallax_with_view(image_view, height: 320, min_height: 64)
    collection_view.portkey_parallax_header_delegate = WeakRef.new(self)
  end

  def portkey_parallax_header(parallax_header, progress: progress)
    NSLog("Progress = #{progress}")
  end

  def collectionView(view, numberOfItemsInSection: section)
    100
  end

  def collectionView(clv, cellForItemAtIndexPath: index_path)
    cell = clv.dequeueReusableCellWithReuseIdentifier(cell_identifier, forIndexPath: index_path)
    cell.text_label.text = "Row #{index_path.row + 1}"
    cell
  end

  private

  def register_cells
    collection_view.registerClass(
      cell_class,
      forCellWithReuseIdentifier: cell_identifier
    )
  end

  def cell_class
    ExampleCollectionViewCell
  end

  def cell_identifier
    cell_class::IDENTIFIER
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

  def collection_view
    @collection_view ||= UICollectionView.alloc.initWithFrame(self.view.bounds, collectionViewLayout: flow_layout).tap do |c|
      c.delegate = self
      c.dataSource = self
      c.alwaysBounceVertical = true
    end
  end

  def flow_layout
    @flow_layout ||= UICollectionViewFlowLayout.alloc.init.tap do |layout|
      layout.itemSize                = CGSizeMake(item_width, item_width)
      layout.scrollDirection         = UICollectionViewScrollDirectionVertical
      layout.minimumInteritemSpacing = 2.0
      layout.minimumLineSpacing      = 2.0
      layout.sectionInset            = UIEdgeInsetsMake(4, 0, 4, 0)
    end
  end

  def item_width
    (self.view.bounds.size.width - 4) / 3.0
  end
end
