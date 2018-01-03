//
//  Rung.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///(a + b) + c = a + (b + c) for all a, b, c in R (+ is associative).
///a + b = b + a for all a, b in R (+ is commutative). *
///There is an element 0 in R such that a + 0 = a for all a in R (0 is the additive identity). *
///For each a in R there exists −a in R such that a + (−a) = 0 (−a is the additive inverse of a). *
///
///(a · b) · c = a · (b · c) for all a, b, c in R (· is associative). *
/// 
///Multiplication is distributive with respect to addition:
///a ⋅ (b + c) = (a · b) + (a · c) for all a, b, c in R (left distributivity).
///(b + c) · a = (b · a) + (c · a) for all a, b, c in R (right distributivity).
public protocol Rng: Ringoid where Adder: Associtive & Commutative & PartialInvertable, Multiplier: Associtive {}
