//
//  Functionals.swift
//  SwiftyAlpha
//
//  Created by Dante Broggi on 7/23/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public struct NilObj: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {  }
    public func toOptional<T>() -> T? {
        return Optional<T>.none
    }
    init?<T>(_ none: T?) {
        if none != nil {
            return nil
        } else {  }
    }
}

public typealias Not<A> = (A) -> Never

//public struct Not<A> {
//    let not: (A) -> Never
//}

public enum Either<A, B> {
    case a(A)
    case b(B)
//    static let left: (A) -> Either<A, B> = Either.a
//    static let right: (B) -> Either<A, B> = Either.b
}

public struct And<A, B> {
  let left: A
  let right: B
  init(_ left: A, _ right: B) {
    self.left = left
    self.right = right
  }
}
