//
//  SemiRing.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

// **AXIOMS**
//
// Associativity:
//    a + (b + c) == (a + b) + c
//    a * (b * c) == (a * b) * c
//
// Identity:
//   a + zero == zero + a == a
//   a * one == one * a == a
//
// Commutativity of +:
//   a + b == b + a
//
// Distributivity:
//   a * (b + c) == a * b + a * c
//   (a + b) * c == a * c + b * c
//
// Annihilation by zero:
//   a * zero == zero * a == zero
//
public protocol SemiRing: Ringoid where Adder: Associtive & Commutative & HasIdentity,
        Multiplier: Associtive & Commutative & HasIdentity & HasAnnialator {}

//extension SemiRing.Multiplier {
//    static var annialator: Return {
//        return adder.identity
//    }
//}
