//
//  Addition.swift
//  WildMath
//
//  Created by Dante Broggi on 6/13/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///(a · b) · c = a · (b · c) for all a, b, c in R (· is associative).
///There is an element 1 in R such that a · 1 = a and 1 · a = a for all a in R (1 is the multiplicative identity).
public typealias Monoid<O : Associtive & HasIdentity> = SemiGroup<O>
