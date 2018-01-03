//
//  Subtractitive.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public protocol Subtractitive: PartialSubtractative/*,NOT Nessesarily: Strideable*/ {
    associatedtype Subtractor: Commutable where Subtractor.Return == Stride
    static var subtractor: Subtractor { get }
    
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
    static func - (lhs: Self, rhs: Self) -> Stride
}

//public extension Subtractitive {
//    static func - (lhs: Self, rhs: Self) -> Stride? {
//        return (lhs - rhs as Stride)
//    }
//}

public extension Subtractitive where Subtractor == AnyOperator<Self> {
    static var subtractor: Subtractor {
        return AnyOperator(function: ((-) as (Self, Self) -> Self))
    }
}

extension Int: Subtractitive {}
extension Int8: Subtractitive {}
extension Int16: Subtractitive {}
extension Int32: Subtractitive {}
extension Int64: Subtractitive {}
