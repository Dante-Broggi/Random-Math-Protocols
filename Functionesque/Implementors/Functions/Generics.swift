//
//  Generics.swift
//  WildMath
//
//  Created by Dante Broggi on 7/4/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

func split<T, U>(_ t: T, into: (T, T) throws -> U) rethrows -> U {
	return try into(t, t)
}

func split<F: Commutable>(_ t: F.Left, into: F) -> F.Return {
	return into[t, t]
}

extension Collection {
	func reduceBy<Op: HasIdentity>(op: Op) -> Op.Return where Op.Left == Element {
		let id: Op.Left = Op.identity
		let sub: (Op.Left, Op.Right) -> Op.Return = {
			(l, r) in
			return op[l, r]
		}
		return self.reduce(id, sub)
	}
}
