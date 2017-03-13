module PortkeyParallaxHeader
  class ShadowView < UIView
    def initWithFrame(frame)
      super.tap do
        self.opaque = false
        backgroundColor = UIColor.brownColor
      end
    end

    def drawRect(rect)
      super
      # General Declaration
      context = UIGraphicsGetCurrentContext()

      # Gradient Declarations
      colors = [
        UIColor.blackColor.CGColor,
        UIColor.clearColor.CGColor
      ]

      num_locations = 2
      type = CGSize.type[/(f|d)/]
      locations = Pointer.new(type, 2)
      locations[0] = 1.0
      locations[1] =  0.0

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
