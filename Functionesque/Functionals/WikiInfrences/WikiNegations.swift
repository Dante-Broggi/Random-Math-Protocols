//
//  WikiNegations.swift
//  DrawTesting
//
//  Created by Dante Broggi on 10/7/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

//https://en.wikipedia.org/wiki/List_of_rules_of_inference

///((P) -> Q, (P) -> Not<Q>) -> Not<P>
func reductioAdAbsurdum<P, Q>(_ q: @escaping (P) -> Q,
                              _ n: @escaping (P) -> Not<Q>) -> Not<P> {
    return { p in
        /*return*/ n(p)((q(p)))
    }
}

///A    therefore    ¬¬A
func notNot<A> (x: A) -> Not<Not<A>> {
    return /*Not<Not<A>>*/ { (n: Not<A>) -> Never in
        /*return*/ n(x)
    }
}
