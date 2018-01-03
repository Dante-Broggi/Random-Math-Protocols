//
//  BiFunctor.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

//public typealias ComparisonResult = CFComparisonResult

///Not a Functional `Functor`, but a generalization of a binary function
public protocol BiFunctor {
    associatedtype Left
    associatedtype Right
    associatedtype Return
    
    ///Apply self
    subscript(_: Left, _: Right) -> Return { get }
}

public protocol Operation: BiFunctor {
    static var symbol: String { get }
}

//protocol ClosedFunctor: BiFunctor where Return != Optional {}

public protocol RightOperator: BiFunctor where Right == Return {}
public protocol LeftOperator: BiFunctor where Left == Return {}

public protocol Commutable: BiFunctor where Left == Right {}

public typealias Operator = LeftOperator & Commutable & RightOperator

public protocol Relator: BiFunctor where Return == Bool {}

public typealias Relation = Relator & Commutable

public protocol Comparator: BiFunctor where Return == ComparisonResult {}

public typealias Comparison = Comparator & Commutable
