class AppDelegate
  def application(application, didFinishLaunchingWithOptions: launch_options)
    return true if RUBYMOTION_ENV == 'test'

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = collection_view
    @window.makeKeyAndVisible

    UINavigationBar.appearance.tintColor = UIColor.whiteColor
    UINavigationBar.appearance.titleTextAttributes = { NSForegroundColorAttributeName => UIColor.whiteColor }
    true
  end

  def table_view
    ExampleTableViewController.alloc.init
  end

  def collection_view
    ExampleCollectionViewController.alloc.init
  end
end
