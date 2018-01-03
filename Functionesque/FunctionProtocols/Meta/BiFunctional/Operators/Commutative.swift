//
//  Commutative.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///Commutativity: For all a, b in A, a • b = b • a
public protocol Commutative: Commutable {}

public typealias CommutativeOperator = Commutative & Flexible

///AntiCommutativity: For all a, b in A, a • b = -(b • a)
///and -(-x) == x
public protocol AntiCommutative: Commutable where Self.Return: Negatable {}

/// -(a • -(b • c)) == (a • (b • c))
//protocol AntiCommutativeOperator: AntiCommutative, Flexible {
//	var distributor: <#type#> { get <#set#>}
//}
