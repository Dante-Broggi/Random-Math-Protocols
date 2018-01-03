import CoreGraphics

public typealias LineCap = CGLineCap
//public typealias LineJoin = CGLineJoin
public typealias FillRule = CGPathFillRule


 enum LineJoin<Space : DrawSpace> {
 ///A join with a sharp (angled) corner.
 ///Core Graphics draws the outer sides of the lines beyond the endpoint of the path, until they meet.
 ///If the length of the miter divided by the line width is greater than the miter limit,
 ////a bevel join is used instead.
 ///The default miter limit is 10
 case miter(limit : Space.LinearDsplacement)
 case round
 case bevel

  static func CGDefaultMiter() -> LineJoin {
		return miter(10)
	}
 }// */
