//
//  Quadrance.swift
//  WildMath
//
//  Created by Dante Broggi on 6/27/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

/// This also equals 16(area)^2 of a planar triangle with quadrances Q1, Q2, Q3
func ArchemedesQuadTriple<Num: Multiplicative & Additive & Subtractitive>
    (Q1: Num, Q2: Num, Q3: Num) -> Num where Num.Multiplier: PowerAssociative,
    Num.Adder: HasIdentity & PowerAssociative, Num.Adder.Left == Num {
	let v: Num = sqSumMinus2SumSq([Q1, Q2, Q3] as [Num])
	return v
}

/// ArchemedesQuadQuad(a, b, c , 0) = ArchemedesQuadTriple(a, b, c)^2
func ArchemedesQuadQuad<Num: Multiplicative & Additive & Subtractitive & ScalarMultiplicative>
    (Q1: Num, Q2: Num, Q3: Num, Q4: Num) -> Num where Num.Multiplier: PowerAssociative,
    Num.Adder: HasIdentity & PowerAssociative, Num.Adder.Left == Num,
    Num.Scalar: ExpressibleByIntegerLiteral {
	let qProd: Num = (Q1 * Q2 * Q3 * Q4)
	let sqMinusEtc: Num = sqSumMinus2SumSq([Q1, Q2, Q3, Q4] as [Num])
	return square(sqMinusEtc) - (64 * qProd)
}
