//
//  Vectorable.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///or is it more a 'VectorSpace'
///ScalarMultiplier: Associtive i.e. x*(y*V) == (x*y)*v
///ScalarMultiplier: Distributive over scalars i.e. (x+y)*V == x*V + y*V
///ScalarMultiplier: Distributive over vectors i.e. r*(X+Y) == r*X + r*Y
public protocol Vector: Module, Multiplicative where Adder: Associtive & Invertable,
        ScalarMultiplier: HasIdentity, Scalar: Field {}
