public protocol AProtoEuclidianSpace: ASpace {
    associatedtype LinearDisplacement: SignedNumeric
    //    associatedtype Rect: RectilinearRectangle
    //    associatedtype Size: RectilinearSize
//    var origin: Point { get }
//    var size: Size { get }
}

public protocol AnEuclidianSpace: AProtoEuclidianSpace where /*LinearDisplacement.Space == Self,*/ Point: PointProto {
//    associatedtype LinearDisplacement: Numeric where LinearDisplacement.Space == Self
    associatedtype Dimention: Hashable
    associatedtype Rect: RectilinearRectangle //where RectilinearRectangle.Space == Self
//    associatedtype Point: PointProto
    associatedtype Size: RectilinearSize //where RectilinearSize.Space == Self
    var origin: Point { get }
    var size: Size { get }
}

public protocol RectilinearRectangle /*: Drawable*/ {
    associatedtype Space: AnEuclidianSpace where Space.Rect == Self
    var origin: Space.Point { get }
    var size: Space.Size { get }
    
    //    init(origin: Space.Point, size: Space.Size)
    init(center: Space.Point, size: Space.Size)
}

//public protocol AngleProto {
//    associatedtype Space: DrawSpace
//    associatedtype BaseNumberType: Numeric
//    var radians: BaseNumberType { get }
//    var degrees: BaseNumberType { get }
//}

public protocol RectilinearSize {
    associatedtype Space: AnEuclidianSpace where Space.Size == Self
    static var zero: Self { get }
    var lengths: [Space.Dimention: Space.LinearDisplacement] { get }
}

public protocol PointProto {
    associatedtype Space: AnEuclidianSpace
    static var origin: Self { get }
    var coordnates: [Space.Dimention: Space.LinearDisplacement] { get }
}
