import CoreGraphics

extension CGMutablePath: RegionRenderer {
//    public typealias Space = CGContext
    public typealias Path = CGMutablePath
    public func draw(from point: CGPoint, by drawing: (inout Path) -> Void) {
        self.move(to: point)
        var tmp = self
        drawing(&tmp)
        self.closeSubpath()
    }
    public func roundedRect(in rect: CGRect, cornerWidth: CGFloat, cornerHeight: CGFloat) {
        addRoundedRect(in: rect, cornerWidth: cornerWidth, cornerHeight: cornerHeight)
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

extension CGMutablePath: PathRenderer {
    public typealias Space = CGContext
    public func line(to point: CGPoint) {
        addLine(to: point)
    }
    public func lines(between points: [CGPoint]) {
        addLines(between: points)
    }
    public func quadraticCurve(to end: CGPoint, control: CGPoint) {
        addQuadCurve(to: end, control: control)
    }
    public func cubicCurve(to end: CGPoint, control1: CGPoint, control2: CGPoint) {
        addCurve(to: end, control1: control1, control2: control2)
    }
    public func arc(tangent1End: CGPoint, tangent2End: CGPoint, radius: CGFloat) {
        addArc(tangent1End: tangent1End, tangent2End: tangent2End, radius: radius)
    }
}
