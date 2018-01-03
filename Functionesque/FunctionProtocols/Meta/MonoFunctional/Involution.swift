//
//  Involution.swift
//  WildMath
//
//  Created by Dante Broggi on 6/28/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///(a^)^ == a.
public protocol SelfInverting: MonoFunctor {}

///1. (a^)^ == a
///
///2. (a * b)^ == b^ * a^
///
///Also if Self: HasIdentity (e)
///
///3. e^ = e * e^ = (e^)^ * e^ = (e * e^)^ = (e^)^ = e
///And if Input: ScalarMultipliable (and λ is a scalar)
///
///4. ((λ * a) + b)^ == (λ^ * a^) + b^
public protocol Involution: SelfInverting {
	associatedtype InvolutionAntiDistributor: AntiDistributor where InvolutionAntiDistributor.Distributed.Right == Void
	var antiDistributor: InvolutionAntiDistributor { get }
}

/*
 http://www2.math.su.se/reports/2001/11/2001-11.pdf
 Definition 2.2 (involution-monoid).
     An involution-monoid is a pair ⟨M, ∗⟩ where M is a monoid and ∗ an involution on it.
     A morphism of involution- monoids φ: ⟨M, ∗⟩ → ⟨N, ⋆⟩ is a monoid morphism M → N
     with φ(x∗) = φ(x)⋆ for every x.
 
 */
