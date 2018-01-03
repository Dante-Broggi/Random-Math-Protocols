//
//  Exponentiation.swift
//  WildMath
//
//  Created by Dante Broggi on 6/27/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

func square<Num: Multiplicative>(_ v: Num) -> Num {
	return v * v
}

func cube<Num: Multiplicative>(_ v: Num) -> Num where Num.Multiplier: PowerAssociative {
	return square(v) * v
}

extension Multiplicative where Multiplier: PowerAssociative {
	///This implimentation only works to positive, integral powers
	static func scalarExponiate<S: Strideable & ExpressibleByIntegerLiteral>(lhs: Self, toThePowerOf rhs: S) -> Self {
		precondition(rhs > 0)
		var out = lhs
		for _ in stride(from: 1, through: rhs, by: 1) {
			out *= lhs
		}
		return out
	}
}

extension Additive where Adder: PowerAssociative {
	///This implimentation only works to positive, integral multipliers
	static func scalarMultiply<S: Strideable & ExpressibleByIntegerLiteral>(lhs: S, times rhs: Self) -> Self {
		precondition(lhs > 0)
		var out = rhs
		for _ in stride(from: 1, through: lhs, by: 1) {
			out += rhs
		}
		return out
	}
}
