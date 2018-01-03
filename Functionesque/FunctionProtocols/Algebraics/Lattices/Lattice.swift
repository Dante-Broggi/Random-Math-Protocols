//
//  Lattice.swift
//  WildMath
//
//  Created by Dante Broggi on 6/27/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

/// Meet, Join obey the Absorption law
///a ¤ (a ⁂ b) = a ⁂ (a ¤ b) = a.
public protocol Lattice {
	associatedtype Meet: Associtive, Commutative, BiIdempotent
	associatedtype Join: Associtive, Commutative, BiIdempotent
}
