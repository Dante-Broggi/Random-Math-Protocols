//
//  MinIntersection.swift
//  WildMath
//
//  Created by Dante Broggi on 6/11/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

infix operator ∩
infix operator ∩=

///Also `min` for integral types
public protocol Intersectable {
    associatedtype Intersector: Operator = AnyOperator<Self>
    static var intersector: Intersector { get }

    static func ∩(lhs: Self, rhs: Self) -> Self
    static func ∩=(lhs: inout Self, rhs: Self)
}

public extension BinaryInteger /*: Unionable*/ {
    static func ∩ (lhs: Self, rhs: Self) -> Self {
        return max(lhs, rhs)
    }
    static func ∩= (lhs: inout Self, rhs: Self) {
        lhs = max(lhs, rhs)
    }
}

public extension SetAlgebra {
    static func ∩ (lhs: Self, rhs: Self) -> Self {
        return lhs.intersection(rhs)
    }
    static func ∩= (lhs: inout Self, rhs: Self) {
        lhs.formIntersection(rhs)
    }
}

extension Intersectable where Intersector == AnyOperator<Self> {
	public static var intersector: Intersector {
        return AnyOperator(function: ((∩) as (Self, Self) -> Self))
    }
}

extension Set: Intersectable {}

extension Int: Intersectable {}
extension Int8: Intersectable {}
extension Int16: Intersectable {}
extension Int32: Intersectable {}
extension Int64: Intersectable {}

extension UInt: Intersectable {}
extension UInt8: Intersectable {}
extension UInt16: Intersectable {}
extension UInt32: Intersectable {}
extension UInt64: Intersectable {}
