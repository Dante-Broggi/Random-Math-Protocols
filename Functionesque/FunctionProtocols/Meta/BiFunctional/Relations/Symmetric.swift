//
//  Symmetric.swift
//  WildMath
//
//  Created by Dante Broggi on 6/13/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///xRy == yRx
public protocol Symmetric: Relation/*, Commutative*/ {}

/// xRy and yRx together imply that x=y.
public protocol AntiSymmetric: Relation {}

// TO ADD:
// https://en.wikipedia.org/wiki/Symplectic_vector_space
