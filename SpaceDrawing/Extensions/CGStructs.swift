import UIKit

//extension NSShadow {
//    convenience init(_ offset : CGSize, _ blur : CGFloat, _ color : Any) {
//        self.init()
//        shadowOffset = offset
//        shadowBlurRadius = blur
//        shadowColor = color
//    }
//}

//public extension Defaults<CGContext>.Shadow<CGFloat> {
//    //    func toNSShadow() -> NSShadow {
//    //        return NSShadow(offset, blur, color)
//    //    }
//}

extension CGContext {
    public typealias Graphics = Options
    public struct Options: GraphicsOptions {
        public typealias Space = CGContext
        public typealias ColorGamut = CGColorSpace
        public typealias Color = ColorGamut.Point
        public typealias Shadow = Defaults<CGContext>.Shadow<CGFloat>
        public typealias Line = Space.Line
        public var color: Color
        public var shadows: Shadow?
        public var shouldAntialias: Bool
        //    public var flatness : Flatness
        public var lineOptions: Line
        public init(color: Color?, shadows: Shadow?, shouldAntialias: Bool, lineOptions: Line) {
            self.color = color ?? UIColor(white: 0, alpha: 0).cgColor
            self.shadows = shadows
            self.shouldAntialias = shouldAntialias
            self.lineOptions = lineOptions
        }
    }
    
    public struct Line: LineDrawingOptions {
        public typealias Dash = Defaults<CGContext>.LineDash<CGFloat>
        public typealias LineDash = Dash
        public typealias Graphics = GraphicsOptions
        
        public var lineCap: LineCap
        public var lineDash: LineDash?
        public var lineJoin: LineJoin
        
        public init(lineCap: LineCap, lineDash: LineDash?, lineJoin: LineJoin) {
            self.lineCap = lineCap
            self.lineDash = lineDash
            self.lineJoin = lineJoin
        }
    }
}
extension CGColorSpace: ColorSpace {
    // ASpace
    public typealias LinearDisplacement = CGFloat
    public typealias Point = CGColor
}

extension CGRect: RectilinearRectangle {
    public typealias Space = CGContext
    public init(center: CGPoint, size: CGSize) {
        origin = CGPoint(x: center.x-size.width/2, y: center.y-size.height/2)
        self.size = size
    }
}
extension CGPoint: PointProto {
    public typealias Space = CGContext
    public static let origin: CGPoint = CGPoint.zero
    public var coordnates: [CGContext.Dimention: CGFloat] {
        return [.standardX: x, .standardY: y]
    }
}

extension CGSize: RectilinearSize {
    public typealias Space = CGContext
    //    static let orgin = CGPoint.zero
    public var lengths: [CGContext.Dimention: CGFloat] {
        return [.standardX: self.width, .standardY: self.height]
    }
}
