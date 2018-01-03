//
//  PartialField.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///A type with the characteristics of a field
///eg. multiplication is commutative
protocol Field: DivisionRing, Subtractitive where Multiplier: PartialInvertable /*& Commutative*/ {}

///A type with some of the characteristics of a field, 
///but may include any/all of (0/0, (+x)/0, (-x)/0)
/// aka zoz/nan, +inf, -inf
protocol PsudoField: Field, Divisible {
    ///will return Multiplier.invert($0) if that is defined (i.e. non-nil)
    static func reciprocate(_: Self) -> Self
//    var isZoZ: Bool { get }
//    var isInfinite: Bool { get }
}
