//
//  Distributive.swift
//  WildMath
//
//  Created by Dante Broggi on 6/28/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///Multiplication is distributive with respect to addition:
///a ⋅ (b + c) = (a · b) + (a · c) for all a, b, c in R (left distributivity).
public protocol LeftDistributive: Additive, Multiplicative {}

///Multiplication is distributive with respect to addition:
///(b + c) · a = (b · a) + (c · a) for all a, b, c in R (right distributivity).
public protocol RightDistributive: Additive, Multiplicative {}

///Multiplication is distributive with respect to addition:
///a ⋅ (b + c) = (a · b) + (a · c) for all a, b, c in R (left distributivity).
///(b + c) · a = (b · a) + (c · a) for all a, b, c in R (right distributivity).
public protocol Distributive: LeftDistributive, RightDistributive {}

///a ⋅ (b + c) = (a · b) + (a · c) for all a, b, c in R (left distributivity)
public protocol LeftDistributor {
	associatedtype Distributed: Operator
	associatedtype DistributedOver: Operator
}

///(b + c) · a = (b · a) + (c · a) for all a, b, c in R (right distributivity)
public protocol RightDistributor {
	associatedtype Distributed: Operator
	associatedtype DistributedOver: Operator
}

///a ⋅ (b + c) = (a · b) + (a · c) for all a, b, c in R (left distributivity)
///(b + c) · a = (b · a) + (c · a) for all a, b, c in R (right distributivity)
public typealias Distributor = LeftDistributor & RightDistributor

///a ⋅ (b + c) = (a · c) + (a · b) for all a, b, c in R (left anti-distributivity)
public protocol LeftAntiDistributor {
	associatedtype Distributed: Operator
	associatedtype DistributedOver: Operator
}
///(b + c) ⋅ a = (c ⋅ a) + (b ⋅ a) for all a, b, c in R (left anti-distributivity)
public protocol RightAntiDistributor {
	associatedtype Distributed: Operator
	associatedtype DistributedOver: Operator
}

///a ⋅ (b + c) = (a · c) + (a · b) for all a, b, c in R (left anti-distributivity)
///(b + c) ⋅ a = (c ⋅ a) + (b ⋅ a) for all a, b, c in R (left anti-distributivity)
public typealias AntiDistributor = LeftAntiDistributor & RightAntiDistributor
