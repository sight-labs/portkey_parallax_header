module PortkeyParallaxHeader
  class ShadowView < UIView
    def initWithFrame(frame)
      super.tap do
        self.opaque = false
      end
    end

    def drawRect(rect)
      super
      # General Declaration
      context = UIGraphicsGetCurrentContext()

      # Gradient Declarations
      colors = [
        UIColor.colorWithWhite(0, alpha: 0.2).CGColor,
        UIColor.clearColor.CGColor
      ]
      # colors = Pointer.new(type, 8)
      # #start color => black color
      # colors[0] = 0.0 #red
      # colors[1] = 0.0 #green
      # colors[2] = 0.0 #blue
      # colors[3] = 0.2 #alpha
      # #end color => clear color
      # colors[4] = 0.0 #red
      # colors[5] = 0.0 #green
      # colors[6] = 0.0 #blue
      # colors[7] = 0.0 #alpha

      num_locations = 2
      type = CGSize.type[/(f|d)/]
      locations = Pointer.new(type, 2)
      locations[0] = 0.0
      locations[1] =  1.0

      color_space = CGColorSpaceCreateDeviceRGB()
      color_gradient = CGGradientCreateWithColors(color_space, colors, locations)

      # Rectangle Drawing
      rectangle_path = UIBezierPath.bezierPathWithRect(CGRectMake(0, 0, CGRectGetWidth(rect), 8))
      CGContextSaveGState(context)
      rectangle_path.addClip
      CGContextDrawLinearGradient(context, color_gradient, CGPointMake(0, CGRectGetHeight(rect)), CGPointMake(0, 0), 0)
      CGContextRestoreGState(context)
    end
  end
end
