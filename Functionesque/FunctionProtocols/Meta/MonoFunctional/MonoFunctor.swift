//
//  MonoFunctor.swift
//  WildMath
//
//  Created by Dante Broggi on 6/28/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///Not a Functional `Functor`, but a generalization of a singular function
public protocol MonoFunctor {
	associatedtype Input
	associatedtype Return
	
	///Apply self
	subscript(_: Input) -> Return { get }
}

public protocol MonoOperative: BiFunctor {
	static var prefixSymbol: String { get }
	static var postfixSymbol: String { get }
}

public protocol Reordering: MonoFunctor where Input == Return {}

public protocol Decider: MonoFunctor where Return == Bool {}
