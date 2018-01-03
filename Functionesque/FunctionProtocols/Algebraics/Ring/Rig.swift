//
//  Rig.swift
//  WildMath
//
//  Created by Dante Broggi on 6/27/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public protocol Rig: /*Additive, Multiplicative,*/ Distributive
        where Adder: Associtive & Commutative & HasIdentity,
        Multiplier: Associtive & HasIdentity & HasAnnialator {
}
