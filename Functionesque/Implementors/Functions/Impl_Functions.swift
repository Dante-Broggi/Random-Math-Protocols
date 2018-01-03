//
//  Functions.swift
//  WildMath
//
//  Created by Dante Broggi on 7/4/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

func SpreadTriple<Num: Multiplicative & Additive & Subtractitive>(S1: Num, S2: Num, S3: Num)
        -> Num where Num.Multiplier: PowerAssociative, Num.Adder: HasIdentity & PowerAssociative,
            Num.Adder.Left == Num {
	let sum: Num = S1 + S2 + S3
	let sum2 = sum + sum
	let sum4: Num = sum2 + sum2
	return sqSumMinus2SumSq([S1, S2, S3]) - sum4
}

///square(Q1 + Q2 + Q3 + ...) - (`2 *` (square(Q1) + square(Q2) + square(Q3) + ...))
func sqSumMinus2SumSq<Num: Multiplicative & Additive & Subtractitive>(_ items: [Num]) -> Num
        where Num.Multiplier: PowerAssociative, Num.Adder: HasIdentity, Num.Adder.Left == Num {
	let sum: Num = items.reduceBy(op: Num.adder)
	let sumSq: Num = square(sum)
	let sq = items.map({square($0)})
	let sqSum: Num = sq.reduceBy(op: Num.adder)
	return ((sumSq - sqSum) - sqSum)
}
