//

public protocol Renderer {
    associatedtype Space: DrawSpace
//    typealias Space = Region.Space
//    associatedtype Region: RegionRenderer where Region.Space == Space
//    associatedtype Path: PathRenderer where Path.Space == Space
    var space: Space { get }
    mutating func fill<Region: RegionRenderer>(byRule rule: FillRule, options: Space.Graphics,
                       drawing: (inout Region) -> Void) where Region.Space == Self.Space
    mutating func strokeRegion<Region: RegionRenderer>(width: Space.LinearDisplacement, options: Space.Graphics,
                               drawing: (inout Region) -> Void) where Region.Space == Self.Space
    mutating func strokePath<Path: PathRenderer>(width: Space.LinearDisplacement, options: Space.Graphics,
                             drawing: (inout Path) -> Void) where Path.Space == Self.Space
    
    // Utility (will be protocol extensions)
    mutating func clear(_ rect: Space.Rect)
    mutating func fill(_ rect: Space.Rect, options: Space.Graphics)
    mutating func fill(_ rects: [Space.Rect], options: Space.Graphics)
    mutating func fillEllipse(in rect: Space.Rect, options: Space.Graphics)
    mutating func stroke(_ rect: Space.Rect, width: Space.LinearDisplacement,
                         options: Space.Graphics)
    mutating func strokeEllipse(in rect: Space.Rect, width: Space.LinearDisplacement,
                                options: Space.Graphics)
//        mutating func func strokeLineSegments(between: [Space.Point],
//                                              width: Space.LinearDisplacement, options: Space.Graphics))
    
    /// Transforms (not finished API)
//    mutating func translateOrigin(to: Space.Point, while drawing: () -> ())
//    mutating func scale(by: Space.Size, while drawing: () -> ())
    //    mutating func rotate(by: Space.Angle, while drawing: () -> ())
}

public protocol Drawable {
    func draw<R: Renderer>(in renderer: inout R)
}
