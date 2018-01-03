//
//  AffineSpace.swift
//  DrawTesting
//
//  Created by Dante Broggi on 10/6/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public protocol AffineSpace: ASpace where Self.Point: Subtractitive {
    associatedtype DisplacementSpace: ASpace where DisplacementSpace.Point: Additive,
    DisplacementSpace.Point.Adder: HasIdentity, DisplacementSpace.Point == Self.Point.Stride
}
