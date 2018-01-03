//
//  Divisible.swift
//  WildMath
//
//  Created by Dante Broggi on 6/11/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public protocol PartialDivisible {
    static func / (lhs: Self, rhs: Self) -> Self?
}

public protocol Divisible: PartialDivisible {
    associatedtype Divisor: Operator = AnyOperator<Self>
    static var divisor: Divisor { get }
    
    static func / (lhs: Self, rhs: Self) -> Self
    static func /= (lhs: inout Self, rhs: Self)
}

public extension Divisible {
    static func / (lhs: Self, rhs: Self) -> Self? {
        return (lhs / rhs as Self)
    }
}

//extension Numeric {
//    typealias Divisor = FuncFunctor<Self, Self, Self>
//    static var divisor: Divisor {
//        return FuncFunctor { lhs, rhs in
//            let (value, didOverflow) = divideWithOverflow(lhs, rhs)
//            if didOverflow {
//                return nil
//            } else {
//                return value
//            }
//        }
//    }
//}

public extension Divisible where Divisor == AnyOperator<Self> {
    static var divisor: Divisor {
        return AnyOperator(function: ((/) as (Self, Self) -> Self))
    }
}

//extension Int: Divisible {}
//extension Int8: Divisible {}
//extension Int16: Divisible {}
//extension Int32: Divisible {}
//extension Int64: Divisible {}
//
//extension UInt: Divisible {}
//extension UInt8: Divisible {}
//extension UInt16: Divisible {}
//extension UInt32: Divisible {}
//extension UInt64: Divisible {}
