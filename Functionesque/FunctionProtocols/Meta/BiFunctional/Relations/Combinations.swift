//
//  Combinations.swift
//  WildMath
//
//  Created by Dante Broggi on 6/13/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

/*
	set-like (or local): for every x in X, the class of all y such that yRx is a set.
     (This makes sense only if relations on proper classes are allowed.)
     The usual ordering < on the class of ordinal numbers is set-like, while its inverse > is not.

	A relation that is symmetric, transitive, and serial is also reflexive.
*/

public typealias ASymmetric = AntiSymmetric & Irreflexive

public typealias PartialEquivalence = Symmetric & Transitive

public typealias Tolerance = Reflexive & Symmetric

public typealias Equivalence = Reflexive & PartialEquivalence

public typealias AdjacencyRelation = Irreflexive & Symmetric

///aka. a PreOrder
public typealias QuasiOrder = Reflexive & Transitive

public typealias PartialOrder = QuasiOrder & AntiSymmetric

public typealias StrictPartialOrder = Transitive & Irreflexive & ASymmetric

//public typealias StrictTotalOrder = StrictPartialOrder & Connexity
//public typealias StrictTotalOrder = Transitive & Trichotomy
public typealias StrictTotalOrder = Transitive & Trichotomy & ASymmetric & StrictPartialOrder & Connexity

public typealias TotalOrder = PartialOrder & Total//ObeysTrichotomyLaw // ie. a,b in S, either a<=b or b<=a.

public typealias StrictWeakOrder = Irreflexive & ASymmetric & Transitive & HasTransitiveityOfIncomparability
