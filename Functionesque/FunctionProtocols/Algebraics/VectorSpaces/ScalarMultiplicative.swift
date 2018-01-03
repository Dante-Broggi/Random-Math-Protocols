//
//  ScalarMultiplicative.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public protocol ScalarMultiplicative: PartialScalarMultiplicative {
    associatedtype ScalarMultiplier: RightOperator //= OperatorFunctor<Self>
    static var scalarMultiplier: ScalarMultiplier { get }
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
    static func * (lhs: Scalar, rhs: Self) -> Self
    
//    static func getScalarMultiplier<T: RightOperator>() -> T where T.Left == Scalar, T.Right == Self
}

public extension ScalarMultiplicative {
    static func * (lhs: Scalar, rhs: Self) -> Self? {
        return (lhs * rhs as Self)
    }
}

extension ScalarMultiplicative where Self: Additive, Self.Scalar: Strideable & ExpressibleByIntegerLiteral {
    ///TODO: check implimentation
    static func * (lhs: Scalar, rhs: Self) -> Self {
        var acc = rhs
        for _ in stride(from: 0, to: lhs, by: 1) {
            acc += rhs
        }
        return acc
    }
}
