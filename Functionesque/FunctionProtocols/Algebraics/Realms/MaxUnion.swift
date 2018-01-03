//
//  MaxUnion.swift
//  WildMath
//
//  Created by Dante Broggi on 6/11/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

infix operator ∪
infix operator ∪=

///Also `max` for integral types
public protocol Unionable {
    associatedtype Unioner: Operator = AnyOperator<Self>
    static var unioner: Unioner { get }

    static func ∪(lhs: Self, rhs: Self) -> Self
    static func ∪=(lhs: inout Self, rhs: Self)
}

public extension BinaryInteger /*: Unionable*/ {
    static func ∪ (lhs: Self, rhs: Self) -> Self {
        return max(lhs, rhs)
    }
    static func ∪= (lhs: inout Self, rhs: Self) {
        lhs = max(lhs, rhs)
    }
}

extension SetAlgebra {
	public static func ∪ (lhs: Self, rhs: Self) -> Self {
        return lhs.union(rhs)
    }
	public static func ∪= (lhs: inout Self, rhs: Self) {
        lhs.formUnion(rhs)
    }
}

extension Unionable where Unioner == AnyOperator<Self> {
	public static var unioner: Unioner {
        return AnyOperator(function: ((∪) as (Self, Self) -> Self))
    }
}

extension Set: Unionable {}

extension Int: Unionable {}
extension Int8: Unionable {}
extension Int16: Unionable {}
extension Int32: Unionable {}
extension Int64: Unionable {}

extension UInt: Unionable {}
extension UInt8: Unionable {}
extension UInt16: Unionable {}
extension UInt32: Unionable {}
extension UInt64: Unionable {}
