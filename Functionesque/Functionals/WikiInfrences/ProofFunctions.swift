//
//  Manipulation.swift
//  SwiftyAlpha
//
//  Created by Dante Broggi on 7/23/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

func identity<A> (_ a: A) -> A { return a }

func deMorgan <A, B> (_ f: @escaping Not<Either<A, B>>) -> And<Not<A>, Not<B>> {
  return And<Not<A>, Not<B>>(
    /*Not<A>*/ {a in f(.a(a))},
    /*Not<B>*/ {b in f(.b(b))}
  )
}

func deMorgan <A, B> (_ f: And<Not<A>, Not<B>>) -> Not<Either<A, B>> {
  return /*Not<Either<A, B>>*/ {(x: Either<A, B>) in
    switch x {
    case let .a(a):
      /*return*/ f.left(a)
    case let .b(b):
      /*return*/ f.right(b)
    }
  }
}

func BWilliams_2_1 <A, B, C> (_ f: @escaping (A) -> B) -> (@escaping (C, B) -> C) -> ((C, A) -> C) {
  return { g in
    return { c, a in
      return c
    }
  }
}

func BWilliams_2_2 <A, B, C> (_ f: @escaping (A) -> B) -> (@escaping (C, B) -> C) -> ((C, A) -> C) {
  return { g in
    return { c, a in
      return g(c, f(a))
    }
  }
}

func BWilliams_3 <A, B, C> (x: A, g: (A) -> B, h: (A) -> C) -> (B, C) {
    return (g(x), h(x))
}

///"¬¬¬A    therefore    ¬A" Impl??
func noNegativeNot<A>(x: @escaping Not<Not<Not<A>>>) -> Not<A> {
    return /*Not*/ { n in
        /*return*/ x(notNot(x: n))
    }
}

///aka. function aplication
func modusPonens<P, Q>(_ x: P, _ f: (P) -> Q) -> Q {
    return f(x)
}

///
func modusTollens<P, Q>(_ nq: @escaping Not<Q>, _ q: @escaping (P) -> Q) -> Not<P> {
    return { p in
        /*return*/ nq(q(p))
    }
}

///
func curry <A, B, C> (_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
  return { a in
    return { b in
      return f(a, b)
    }
  }
}

/// (P) -> Q) -> ((Not<Q>) -> Not<P>)
func contraposition<P, Q>(_ x: @escaping (P) -> Q) -> (( @escaping Not<Q>) -> Not<P>) {
    return { nq in
        return { p in 
            /*return*/ nq(x(p))
        }
    }
}

/// (Either<P, Q>, Either<Not<P>, R>) -> Either<Q, R>
func resolution<P, Q, R>(_ epq: Either<P, Q>, _ npq: Either<Not<P>, R>,
                         _ pnp: (P, Not<P>) -> Either<Q, R>) -> Either<Q, R> {
    switch (epq, npq) {
    case (.a(let p), .a(let np)):
        return pnp(p, np)
    case (.a(_ /*let p*/), .b(let r)):
        return .b(r)
    case (.b(let q), .a(_ /*let np*/)):
        return .a(q)
    case (.b(let q), .b(_ /*let r*/)):
        return .a(q) // .b(r)
    }
}
