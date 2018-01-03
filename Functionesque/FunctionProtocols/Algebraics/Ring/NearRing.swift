//
//  NearRing.swift
//  WildMath
//
//  Created by Dante Broggi on 6/27/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public protocol RightNearRing: /*Additive, Multiplicative,*/ RightDistributive
        where Adder: Associtive & Cancellative & Invertable, Multiplier: Associtive {}

public protocol LeftNearRing: /*Additive, Multiplicative,*/ LeftDistributive
        where Adder: Associtive & Cancellative & Invertable, Multiplier: Associtive {}
