//
//  Biconditionals.swift
//  DrawTesting
//
//  Created by Dante Broggi on 10/7/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

//https://en.wikipedia.org/wiki/List_of_rules_of_inference

typealias Biconditional<P, Q> = And<(P) -> Q, (Q) -> P>

//
//func biconditional(<#parameters#>) -> <#return type#> {
//    <#function body#>
//}

extension Biconditional /*<P, Q> where A == (P)-> Q, B == (Q) -> P*/ {
    func evaluate<P, Q>(_ x: P) -> Q where A == (P) -> Q {
        return self.left(x)
    }
    func evaluate<P, Q>(_ x: Q) -> P where B == (Q) -> P {
        return self.right(x)
    }
    
    func evaluate<P, Q>(_ x: @escaping Not<P>) -> Not<Q> where A == (Q) -> P {
        return { q in
            x(self.left(q))
        }
    }
    func evaluate<P, Q>(_ x: @escaping Not<P>) -> Not<Q> where B == (Q) -> P {
        return { q in
            x(self.right(q))
        }
    }
    func evaluate<P, Q>(_ x: Either<P, Q>) -> (P, Q) where A == (P) -> Q, B == (Q) -> P {
        switch x {
        case .a(let p):
            return (p, self.left(p))
        case .b(let q):
            return (self.right(q), q)
        }
    }
    func evaluate<P, Q>(_ x: Either<Not<P>, Not<Q>>) -> (Not<P>, Not<Q>)
        where A == (P) -> Q, B == (Q) -> P {
        switch x {
        case .a(let np):
            let nq: Not<Q> = { q in
                /*return*/ np(self.right(q))
            }
            return (np, nq)
        case .b(let nq):
            let np: Not<P> = { p in
                /*return*/ nq(self.left(p))
            }
            return (np, nq)
        }
    }
}
