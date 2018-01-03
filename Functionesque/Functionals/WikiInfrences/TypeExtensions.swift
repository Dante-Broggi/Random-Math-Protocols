//
//  TypeExtensions.swift
//  DrawTesting
//
//  Created by Dante Broggi on 10/8/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

extension And {
    var tuple: (A, B) {
        return (left, right)
    }
    init(_ t: (A, B)) {
        (left, right) = t
    }
    init(swap: And<B, A>) {
        left = swap.right
        right = swap.left
    }
    init<X, Y>(transferToLeft transfer: And<X, And<Y, B>>) where A == And<X, Y> {
        left = And<X, Y>(transfer.left, transfer.right.left)
        right = transfer.right.right
    }
    init<X, Y>(transferToRight transfer: And<And<A, X>, Y>) where B == And<X, Y> {
        left = transfer.left.left
        right = And<X, Y>(transfer.left.right, transfer.right)
    }
}

extension Either where A == B {
    var value: A {
        switch self {
        case .a(let x):
            return x
        case .b(let x):
            return x
        }
    }
}

extension Either {
//    func disjunctionIntroduction<P, Q>(_ x: P) -> Either<P, Q> {
//        return .a(x)
//    }
    init(swap: Either<B, A>) {
        switch swap {
        case .a(let b):
            self = .b(b)
        case .b(let a):
            self = .a(a)
        }
    }
    init<X, Y>(transferToLeft transfer: Either<X, Either<Y, B>>) where A == Either<X, Y> {
        switch transfer {
        case .a(let x):
            self = .a(.a(x))
        case .b(let eyb):
            switch eyb {
            case .a(let y):
                self = .a(.b(y))
            case .b(let b):
                self = .b(b)
            }
        }
    }
    init<X, Y>(transferToRight transfer: Either<Either<A, X>, Y>) where B == Either<X, Y> {
        switch transfer {
        case .a(let eax):
            switch eax {
            case .a(let a):
                self = .a(a)
            case .b(let x):
                self = .b(.a(x))
            }
        case .b(let y):
            self = .b(.b(y))
        }
    }
    init<P, Q, R>(distributing x: And<Either<P, Q>, R>) where A == And<P, R>, B == And<Q, R> {
        switch x.left {
        case .a(let p):
            self = .a(And(p, x.right))
        case .b(let q):
            self = .b(And(q, x.right))
        }
    }
}
