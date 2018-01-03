//
//  Multiplicative.swift
//  WildMath
//
//  Created by Dante Broggi on 6/11/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//
//typealias MultiplicativeMagma = Multiplicative

public protocol Multiplicative: PartialMultiplicative {
    associatedtype Multiplier: Operator = AnyOperator<Self>
    static var multiplier: Multiplier { get }
    
    /// Multiplies two values and produces their product.
    ///
    /// The multiplication operator (`*`) calculates the product of its two
    /// arguments. For example:
    ///
    ///     2 * 3                   // 6
    ///     100 * 21                // 2100
    ///     -10 * 15                // -150
    ///     3.5 * 2.25              // 7.875
    ///
    /// You cannot use `*` with arguments of different types. To multiply values
    /// of different types, convert one of the values to the other value's type.
    ///
    ///     let x: Int8 = 21
    ///     let y: Int = 1000000
    ///     Int(x) * y              // 21000000
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    static func * (lhs: Self, rhs: Self) -> Self
    
    /// Multiplies two values and stores the result in the left-hand-side
    /// variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    static func *= (lhs: inout Self, rhs: Self)
}

public extension Multiplicative {
    static func * (lhs: Self, rhs: Self) -> Self? {
        return (lhs * rhs as Self)
    }
}

public extension Multiplicative where Multiplier == AnyOperator<Self> {
	public static var multiplier: Multiplier {
        return AnyOperator(function: ((*) as (Self, Self) -> Self))
    }
}

//public extension Numeric {
//    typealias Multiplier = OperatorFunctor<Self, Self, Self>
//    static var multiplier: Multiplier {
//        return AnyOperator(function: ((*) as (Self, Self) -> Self))
//    }
//}

extension Int: Multiplicative { }
extension Int8: Multiplicative { }
extension Int16: Multiplicative { }
extension Int32: Multiplicative { }
extension Int64: Multiplicative { }

extension UInt: Multiplicative { }
extension UInt8: Multiplicative { }
extension UInt16: Multiplicative { }
extension UInt32: Multiplicative { }
extension UInt64: Multiplicative { }
