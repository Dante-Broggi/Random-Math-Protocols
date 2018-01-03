import CoreGraphics

extension CGContext: DrawSpace {
    //DrawSpace
//    public typealias Graphics = Options
    typealias Color = CGColor
    // ASpace
    public typealias LinearDisplacement = CGFloat
    public enum Dimention: Hashable {
        case standardX, standardY //, standardZ
    }
    public typealias Rect = CGRect
    public typealias Point = CGPoint
    public typealias Size = CGSize
    public var origin: Point {
        return CGPoint.zero
    }
    public var size: Size {
        return self.boundingBoxOfClipPath.size
    }
}

extension CGContext: Renderer {
    public typealias Space = CGContext
    public typealias Region = CGContext
    public typealias Path = CGMutablePath
    public var space: Space {
        return self
    }
    private func inNewGState(_ block : () -> Void) {
        self.saveGState()
        block()
        self.restoreGState()
    }
    public func fill(byRule rule: CGPathFillRule, options: Options, drawing: (inout Region) -> Void) {
        inNewGState {
            self.setFillColor(options.color)
            //TODO: other options: e.g. "self.setLineWidth(options.line.)"
            self.beginPath()
            var tmp = self
            drawing(&tmp)
            self.fillPath(using: rule)
        }
    }
    public func strokeRegion(width: CGFloat, options: Options, drawing: (inout Region) -> Void) {
        inNewGState {
            self.setLineWidth(width)
            self.setStrokeColor(options.color)
            self.beginPath()
            var tmp = self
            drawing(&tmp)
            self.strokePath()
        }
    }
    public func strokePath(width: CGFloat, options: Options, drawing: (inout Path) -> Void) {
        inNewGState {
            self.setLineWidth(width)
            self.setStrokeColor(options.color)
            self.beginPath()
            var tmp = CGMutablePath()
            drawing(&tmp)
            self.addPath(tmp)
            self.strokePath()
        }
    }
    public func fill(_ rect: CGRect, options: Options) {
        inNewGState {
            setFillColor(options.color)
            fill(rect)
        }
    }
    public func fill(_ rects: [CGRect], options: Options) {
        inNewGState {
            setFillColor(options.color)
            fill(rects)
        }
    }
    public func fillEllipse(in rect: CGRect, options: Options) {
        inNewGState {
            setFillColor(options.color)
            fillEllipse(in: rect)
        }
    }
    public func stroke(_ rect: CGRect, width: CGFloat, options: Options) {
        inNewGState {
            setLineWidth(width)
            setStrokeColor(options.color)
            stroke(rect)
        }
    }
    public func strokeEllipse(in rect: CGRect, width: CGFloat, options: Options) {
        inNewGState {
            setLineWidth(width)
            setStrokeColor(options.color)
            strokeEllipse(in: rect)
        }
    }
}

extension CGContext: RegionRenderer {
    public func draw(from point: CGPoint, by drawing: (inout CGMutablePath) -> Void) {
        var subpath = CGMutablePath()
        subpath.move(to: point)
        drawing(&subpath)
        subpath.closeSubpath()
        self.addPath(subpath)
    }
    public func roundedRect(in rect: CGRect, cornerWidth: CGFloat, cornerHeight: CGFloat) {
        let rounded = CGPath(roundedRect: rect, cornerWidth: cornerWidth, cornerHeight: cornerHeight, transform: nil)
        addPath(rounded)
    }
    public func rect(_ rect: CGRect) {
        addRect(rect)
    }
    public func rects(_ rects: [CGRect]) {
        addRects(rects)
    }
    public func ellipse(in rect: CGRect) {
        addEllipse(in: rect)
    }
}
