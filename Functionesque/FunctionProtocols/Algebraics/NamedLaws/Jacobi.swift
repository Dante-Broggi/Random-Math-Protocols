//
//  Jacobi.swift
//  WildMath
//
//  Created by Dante Broggi on 6/27/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///a • (b • c) + b • (c • a) + c • (a • b) = 0
public protocol Jacobi: Additive, Multiplicative where Adder: HasIdentity, Multiplier: Flexible {}
