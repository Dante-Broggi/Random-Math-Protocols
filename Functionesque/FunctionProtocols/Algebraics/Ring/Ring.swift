//
//  Ring.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///R is a monoid under multiplication, meaning that:
///(a · b) · c = a · (b · c) for all a, b, c in R (· is associative).
///There is an element 1 in R such that a · 1 = a and 1 · a = a for all a in R (1 is the multiplicative identity). 
///
///Multiplication is distributive with respect to addition:
///a ⋅ (b + c) = (a · b) + (a · c) for all a, b, c in R (left distributivity).
///(b + c) · a = (b · a) + (c · a) for all a, b, c in R (right distributivity).
public protocol UnitRing: Rng, SemiRing, LeftNearRing, RightNearRing {}

/// a ⋅ b == 0 implies a == 0 or b == 0
public protocol Domain: UnitRing /*, Zero ProductProperty*/ /*where Multiplier: HasAnnialator*/ {}
