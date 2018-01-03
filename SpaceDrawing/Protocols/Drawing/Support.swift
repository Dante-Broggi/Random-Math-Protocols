//

public protocol ColorSpace: AProtoEuclidianSpace {
    typealias Color = Point
}

public protocol DrawSpace: AnEuclidianSpace {
    //    typealias Length = LinearDisplacement
    //    @available(deprecated: "Angles are obsolete, use spreads instead")
    //    associatedtype Angle: AngleProto
    associatedtype Graphics: GraphicsOptions where Graphics.Space == Self
    typealias Color = Graphics.Color
}

public protocol GraphicsOptions {
    associatedtype Space: DrawSpace //where Space.Graphics == Self
    associatedtype ColorGamut: ColorSpace
    typealias Color = ColorGamut.Point
    associatedtype Shadow: ShadowProto //where Shadow.Graphics == Self
    associatedtype Line: LineDrawingOptions
    var color: Color { get set }
    var shadows: Shadow? { get set }
    var shouldAntialias: Bool { get set }
    //    var flatness: Flatness { get set }
    var lineOptions: Line { get set }
    
    init(color: Color?, shadows: Shadow?, shouldAntialias: Bool, lineOptions: Line)
}

public protocol LineDrawingOptions {
    associatedtype Graphics //: GraphicsOptions //where Graphics.LineDash == Self
    associatedtype LineDash: LineDashProto where LineDash.Graphics == Graphics
    var lineCap: LineCap { get set }
    var lineDash: LineDash? { get set }
    var lineJoin: LineJoin { get set }
    init(lineCap: LineCap, lineDash: LineDash?, lineJoin: LineJoin)
}

public protocol LineDashProto {
//    associatedtype Graphics: GraphicsOptions where Graphics.Line == Self
    associatedtype Space: DrawSpace where Space.Graphics.Line == Self
    associatedtype PhaseOffset: Numeric
    var phaseOffset: PhaseOffset { get set }
    var pattern: [Space.LinearDisplacement] { get set }
}

public protocol ShadowProto {
//    associatedtype Graphics: GraphicsOptions /*where Graphics.Shadow == Self*/
    associatedtype Space: DrawSpace where Space.Graphics.Shadow == Self
    associatedtype BlurAmmount: Numeric
    var color: Space.Color { get set }
    var offset: Space.Size { get set }
    var blur: BlurAmmount { get set }
}
