//
//  PartialSubtractative.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public protocol PartialSubtractative /*: PartialAdditive*/ {
    associatedtype Stride: Additive
    /// Subtracts one value from another and produces their difference.
    ///
    /// The subtraction operator (`-`) calculates the difference of its two
    /// arguments. For example:
    ///
    ///     8 - 3                   // 5
    ///     -10 - 5                 // -15
    ///     100 - -5                // 105
    ///     10.5 - 100.0            // -89.5
    ///
    /// You cannot use `-` with arguments of different types. To subtract values
    /// of different types, convert one of the values to the other value's type.
    ///
    ///     let x: UInt8 = 21
    ///     let y: UInt = 1000000
    ///     y - UInt(x)             // 999979
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    static func - (lhs: Self, rhs: Self) -> Stride?
    static func + (lhs: Self, rhs: Stride) -> Self
}

public extension Strideable {
    static func - (lhs: Self, rhs: Self) -> Stride? {
        return lhs.distance(to: rhs)
    }
    static func + (lhs: Self, rhs: Stride) -> Self {
        return lhs.advanced(by: rhs)
    }
}

extension UInt: PartialSubtractative {}
extension UInt8: PartialSubtractative {}
extension UInt16: PartialSubtractative {}
extension UInt32: PartialSubtractative {}
extension UInt64: PartialSubtractative {}
