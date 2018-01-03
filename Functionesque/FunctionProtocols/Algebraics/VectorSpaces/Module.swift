//
//  Module.swift
//  WildMath
//
//  Created by Dante Broggi on 6/13/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public protocol Module: Additive, ScalarMultiplicative where Adder: Commutative, Scalar: UnitRing {}
