//

extension Renderer {
    mutating func clear(_ rect: Space.Rect) {
        fill(rect, options: Space.Graphics())
    }
//    mutating func fill(_ rect: Space.Rect, options: Space.Graphics)
    mutating func fill(_ rects: [Space.Rect], options: Space.Graphics) {
        for rect in rects {
            fill(rect, options: options)
        }
    }
//    mutating func fillEllipse(in rect: Space.Rect, options: Space.Graphics)
//    mutating func stroke(_ rect: Space.Rect, width: Space.LinearDisplacement, options: Space.Graphics)
//    mutating func strokeEllipse(in rect: Space.Rect, width: Space.LinearDisplacement, options: Space.Graphics)
}

extension RegionRenderer {
//    mutating func roundedRect(in rect: Space.Rect,
//                              cornerWidth: Space.LinearDisplacement,
//                              cornerHeight: Space.LinearDisplacement)
    
//    mutating func rect(_ rect: Space.Rect)
    
    mutating func rects(_ rects: [Space.Rect]) {
        for rct in rects {
            rect(rct)
        }
    }
    
//    mutating func ellipse(in rect: Space.Rect)
}

extension PathRenderer {
//    mutating func line(to point: Space.Point)
//    mutating func quadraticCurve(to end: Space.Point, control: Space.Point)
//    mutating func cubicCurve(to end: Space.Point, control1: Space.Point, control2: Space.Point)
//    mutating func lines(between points: [Space.Point]) {
//        for p in points {
//            line(to: p)
//        }
//    }
    
    //    @available(deprecated: "Angles are obsolete, use spreads instead")
//        mutating func relativeArc(center: Space.Point, radius: Space.LinearDisplacement,
//                                  startAngle: Space.Angle, delta: Space.Angle.BaseNumberType)
    
    //    @available(deprecated: "Angles are obsolete, use spreads instead")
//        mutating func arc(center: Space.Point, radius: Space.LinearDisplacement,
//                          startAngle: Space.Angle, endAngle: Space.Angle, clockwise: Bool)
//    mutating func arc(tangent1End: Space.Point, tangent2End: Space.Point, radius: Space.LinearDisplacement)
}

extension GraphicsOptions {
    init() {
        self.init(color: nil, shadows: nil, shouldAntialias: false, lineOptions: Line())
    }
}

extension LineDrawingOptions {
    init(cap: LineCap, dash: LineDash?, join: LineJoin) {
        self.init(lineCap: cap, lineDash: dash, lineJoin: join)
    }
    init() {
        self.init(lineCap: LineCap.butt, lineDash: nil, lineJoin: LineJoin.bevel)
    }
}
