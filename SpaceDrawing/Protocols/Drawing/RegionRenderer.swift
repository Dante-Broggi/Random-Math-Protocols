//
//  RegionRenderer.swift
//  DrawTesting
//
//  Created by Dante Broggi on 9/24/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///A region is a path that returns to it's beginning (i.e. rects, ellipses)
public protocol RegionRenderer {
    typealias Graphics = Space.Graphics
    //    associatedtype Space : DrawSpace
    typealias Space = Path.Space
    associatedtype Path: PathRenderer
    
    ///returns to the begining (with a line) implicitly
    mutating func draw(from point: Space.Point, by drawing : (inout Path) -> Void) /*where Path.Space == Space*/
    
    mutating func roundedRect(in rect: Space.Rect, cornerWidth: Space.LinearDisplacement,
                              cornerHeight: Space.LinearDisplacement)
    
    mutating func rect(_ rect: Space.Rect)
    
    mutating func rects(_ rects: [Space.Rect])
    
    mutating func ellipse(in rect: Space.Rect)
}
