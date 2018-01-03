//
//  WikiDisjunctions.swift
//  DrawTesting
//
//  Created by Dante Broggi on 10/7/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

//https://en.wikipedia.org/wiki/List_of_rules_of_inference

///
func disjunctionElimination<P, Q, R>(_ p: (P) -> Q, _ r: (R) -> Q, _ x: Either<P, R>) -> Q {
    switch x {
    case .a(let a):
        return p(a)
    case .b(let b):
        return r(b)
    }
}

///
func constructiveDilemma<P, Q, R, S>(_ q: (P) -> Q, _ s: (R) -> S, x: Either<P, R>) -> Either<Q, S> {
    switch x {
    case .a(let p):
        return .a(q(p))
    case .b(let r):
        return .b(s(r))
    }
}
