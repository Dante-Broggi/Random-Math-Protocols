//
//  LieAlgebra.swift
//  WildMath
//
//  Created by Dante Broggi on 6/27/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

/**
A Lie algebra is a vector space `g` over some field `F` together with a binary operation [x,y]
     called the Lie bracket that satisfies the following axioms:
Bilinearity:
	[ax + by, z] == a[x, z] + b[y, z]
	[z, ax + by] == a[z, x] + b[z, y]
	for all scalars a, b in `F` and all elements x, y, z in `g`

Alternativity:
	[x, x] = 0
	for all x in `g`

The Jacobi identity:
	///a • (b • c) + b • (c • a) + c • (a • b) = 0
	for all elements x, y in `g`

If the field's characteristic is not 2 then anticommutativity implies alternativity.
*/

public protocol LieAlgebra {
	associatedtype LieBracket: Jacobi, Alternative where LieBracket.Return == Self
	static var lieBracket: LieBracket { get }
}
