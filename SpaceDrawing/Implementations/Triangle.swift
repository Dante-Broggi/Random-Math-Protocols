//
//  Triangle.swift
//  DrawTesting
//
//  Created by Dante Broggi on 9/24/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

struct Triangle<Space: DrawSpace>: Drawable {
    var ptA: Space.Point
    var ptB: Space.Point
    var ptC: Space.Point
    
    func draw<R>(in renderer: inout R) where R: Renderer, R.Space == Space, R.Region.Path.Space == Space {
        func fillShape(regRend : inout R.Region) {
            func drawEdges /*<RP : PathRenderer>*/ (pathRend : inout R.Region.Path) {
                pathRend.line(to: ptB)
                pathRend.line(to: ptC)
            }
            regRend.draw(from: ptA, by: drawEdges)
        }
        renderer.fill(byRule: .evenOdd, options: R.Space.Graphics(), drawing: fillShape)
    }
}
