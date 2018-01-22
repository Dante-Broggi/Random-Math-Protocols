//
//  Additive.swift
//  WildMath
//
//  Created by Dante Broggi on 6/11/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public protocol PartialAdditive {
    associatedtype Stride
    static func + (lhs: Self, rhs: Self) -> Self?
}

public protocol Additive: PartialAdditive {
//    associatedtype Stride
    associatedtype Adder: Operator
    static var adder: Adder { get }

    /// Adds two values and produces their sum.
    ///
    /// The addition operator (`+`) calculates the sum of its two arguments. For
    /// example:
    ///
    ///     1 + 2                   // 3
    ///     -10 + 15                // 5
    ///     -15 + -5                // -20
    ///     21.5 + 3.25             // 24.75
    ///
    /// You cannot use `+` with arguments of different types. To add values of
    /// different types, convert one of the values to the other value's type.
    ///
    ///     let x: Int8 = 21
    ///     let y: Int = 1000000
    ///     Int(x) + y              // 1000021
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    static func + (lhs: Self, rhs: Self) -> Self

    /// Adds two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    static func += (lhs: inout Self, rhs: Self)
}

public extension Additive {
    static func + (lhs: Self, rhs: Self) -> Self? {
        return (lhs + rhs as Self)
    }
}

public extension Additive where Adder == AnyOperator<Self> {
    static var adder: Adder {
        return AnyOperator(function: ((+) as (Self, Self) -> Self))
    }
}

extension Int: Additive {}
extension Int8: Additive {}
extension Int16: Additive {}
extension Int32: Additive {}
extension Int64: Additive {}

extension UInt: Additive {}
extension UInt8: Additive {}
extension UInt16: Additive {}
extension UInt32: Additive {}
extension UInt64: Additive {}
