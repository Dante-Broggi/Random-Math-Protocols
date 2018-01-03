//
//  NonContructive.swift
//  DrawTesting
//
//  Created by Dante Broggi on 10/8/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

//https://www.physicsforums.com/threads/constructive-proof-of-material-implication.407699/

///(Φ , ¬ α ⊢ ⊥) ⇒ Φ ⊢ α
typealias UnprovableUnnamed1<P, Q> = (Not<(And<P, Not<Q>>)>) -> (P) -> Q

///Impossible:
///(P) -> Q) -> Either<Not<P>, Q>
typealias MaterialImplication<P, Q> = ((P) -> Q) -> Either<Not<P>, Q>
typealias MaterialImplicationInv<P, Q> = (Either<Not<P>, Q>) -> ((P) -> Q)

/// Either<Not<P>, Q> -> ((P) -> Q))
//func materialImplication<P, Q>(_ x: Either<Not<P>, Q>) -> ((P) -> Q) {
//    switch x {
//    case .a(let np):
//        return { p in
//            np(p)
//        }
//    case .b(let q):
//        return { p in
//            return q
//        }
//    }
//}

typealias NotNotInv<A> = (Not<Not<A>>) -> A
///¬¬A    therefore    A
//func notNot<A> (x: Not<Not<A>>) -> A {
//    return /*Not<Not<A>>*/ { (n: Not<A>) -> Never in
//        /*return*/ n(x)
//    }
//}

typealias DisjunctiveSyllogism<P, Q> = (And<Either<P, Q>, Not<P>>) -> Q
typealias DisjunctiveSyllogismInv<P, Q> = (And<Either<P, Q>, P>) -> Not<Q>
///Imposible:
///((P or Q) and  ¬P) -> Q
func disjunctiveSyllogism<P, Q>(_ x: Either<P, Q>, _ np: @escaping Not<P>)
        -> Either<() -> Never, Q> {
    switch x {
    case .a(let p):
        return .a({ np(p) })
    case .b(let q):
        return .b(q)
    }
}
