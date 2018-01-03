// --

//public struct AnyPathRenderer<_Space : DrawSpace> : PathRenderer {
//    public typealias Space = _Space
//    init<P : PathRenderer>(_ p : PathRenderer) /*where P.Space == Space*/ {
//        _line = p.line
//        _quadraticCurve = p.quadraticCurve
//        _cubicCurve = p.cubicCurve
//        _lines = p.lines
//
//        _arc = p.arc
//    }
//
//    var _line : (_ to: Space.Point) -> ()
//    var _quadraticCurve : (_ end: Space.Point, _ control: Space.Point) -> ()
//    var _cubicCurve : (_ end: Space.Point, _ control1: Space.Point, _ control2: Space.Point) -> ()
//    var _lines : (_ between: [Space.Point]) -> Void
//
//    //    @available(deprecated: "Angles are obsolete, use spreads instead")
//        var _relativeArc(_ center: Space.Point, radius: Space.LinearDisplacement,
//                         startAngle: Space.Angle, delta: Space.Angle.BaseNumberType) -> Void
//
//    //    @available(deprecated: "Angles are obsolete, use spreads instead")
//        var _arc(_ center: Space.Point, radius: Space.LinearDisplacement,
//                 startAngle: Space.Angle, endAngle: Space.Angle, clockwise: Bool) -> Void
//    var _arc : (_ tangent1End: Space.Point, _ tangent2End: Space.Point, _ radius: Space.LinearDisplacement) -> Void
//
//    mutating func line(to point: Space.Point) {
//        _line(point)
//    }
//    mutating func quadraticCurve(to end: Space.Point, control: Space.Point) {
//        _quadraticCurve(end, control)
//    }
//    mutating func cubicCurve(to end: Space.Point, control1: Space.Point, control2: Space.Point) {
//        _cubicCurve(end, control1, control2)
//    }
//    mutating func lines(between points: [Space.Point]) {
//        _lines(points)
//    }
//
//    //    @available(deprecated: "Angles are obsolete, use spreads instead")
//        mutating func relativeArc(center: Space.Point, radius: Space.LinearDisplacement,
//                                  startAngle: Space.Angle, delta: Space.Angle.BaseNumberType)
//
//    //    @available(deprecated: "Angles are obsolete, use spreads instead")
//        mutating func arc(center: Space.Point, radius: Space.LinearDisplacement,
//                          startAngle: Space.Angle, endAngle: Space.Angle, clockwise: Bool)
//    mutating func arc(tangent1End: Space.Point, tangent2End: Space.Point, radius: Space.LinearDisplacement) {
//        _arc(tangent1End, tangent2End, radius)
//    }
//}
