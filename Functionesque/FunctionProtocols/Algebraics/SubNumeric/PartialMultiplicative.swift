//
//  PartialMultiplicative.swift
//  WildMath
//
//  Created by Dante Broggi on 6/11/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public protocol PartialMultiplicative {
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
    static func * (lhs: Self, rhs: Self) -> Self?
}
