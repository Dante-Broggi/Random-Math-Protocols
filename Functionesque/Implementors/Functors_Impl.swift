//
//  FuncFunctor.swift
//  WildMath
//
//  Created by Dante Broggi on 6/13/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public struct AnyFunction<L, R, N>: BiFunctor {
	public typealias Left = L
	public typealias Right = R
	public typealias Return = N

    let function: (_: Left, _: Right) -> Return
    
	public subscript(_ l: Left, _ r: Right) -> Return {
        return function(l, r)
    }
}

public struct AnyFunctor<O: BiFunctor>: BiFunctor {
    public typealias Left = O.Left
    public typealias Right = O.Right
    public typealias Return = O.Return
    
    var functor: O
    
    ///Apply self
    public subscript(_ l: Left, _ r: Right) -> Return {
        get {
            return functor[l, r]
        }
    }
}

public struct AnyOperator<T>: Operator {
    public typealias Left = T
    public typealias Right = T
    public typealias Return = T

    let function: (_: Left, _: Right) -> Return

    public subscript(_ l: Left, _ r: Right) -> Return {
        return function(l, r)
    }
}

//public struct RelationFunctor<T>: Relation {
//    public typealias Left = T
//    public typealias Right = T
//    public typealias Return = Bool
//
//    let function: (_: Left, _: Right) -> Return
//
//    public subscript(_ l: Left, _ r: Right) -> Return {
//        return function(l, r)
//    }
//}

struct EquatableRelator<T: Equatable>: Equivalence, Coreflexive {
    typealias Left = T
    typealias Right = T
    typealias Return = Bool
    
    ///Apply self
    subscript(_ l: Left, _ r: Right) -> Return {
        return l == r
    }
}

public struct NumericNegator<T: SignedNumeric>: SelfInverting {
	public typealias Input = T
	public typealias Return = T
	
	///Apply self
	public subscript(_ r: Input) -> Return {
		return -r
	}
}
