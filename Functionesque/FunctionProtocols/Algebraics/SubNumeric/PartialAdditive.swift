//
//  PartialAdditive.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public protocol PsudoAdditive {
    associatedtype Stride
    static func + (lhs: Self, rhs: Stride) -> Self?
}

public protocol PartialAdditive: PsudoAdditive {
//    associatedtype Stride
    associatedtype Adder: LeftOperator where Adder.Right == Stride
    static var adder: Adder { get }
    static func + (lhs: Self, rhs: Stride) -> Self
}

extension PartialAdditive {
    public static func + (lhs: Self, rhs: Stride) -> Self? {
        return (lhs + rhs as Self)
    }
}
