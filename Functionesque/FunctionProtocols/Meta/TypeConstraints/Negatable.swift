//
//  Negatable.swift
//  WildMath
//
//  Created by Dante Broggi on 7/2/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public protocol Negatable {
	associatedtype Negator: SelfInverting
	static var negator: Negator { get }
	prefix static func - (rhs: Self) -> Self
}

public extension Negatable {
    static prefix func + (rhs: Self) -> Self {
        return rhs
    }
}

public extension Negatable where Negator == NumericNegator<Self> {
	static var negator: NumericNegator<Self> {
		return NumericNegator<Self>()//(function: ((-) as (Self) -> Self))
	}
}

public extension SignedNumeric {
    typealias Negator = NumericNegator<Self>
    static var negator: NumericNegator<Self> {
        return NumericNegator<Self>()
    }
}

//public extension Numeric {
//    typealias Multiplier = OperatorFunctor<Self, Self, Self>
//    static var multiplier: Multiplier {
//        return AnyOperator(function: ((*) as (Self, Self) -> Self))
//    }
//}

extension Int: Negatable { }
extension Int8: Negatable { }
extension Int16: Negatable { }
extension Int32: Negatable { }
extension Int64: Negatable { }
