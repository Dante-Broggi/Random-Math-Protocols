//
//  Throwing.swift
//  SwiftyAlpha
//
//  Created by Dante Broggi on 7/23/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

func throwFrom<T, R, E: Error>(f: @escaping (T) -> Either<R, E>) -> (T) throws -> R {
    return { t in
        switch f(t) {
        case .a(let r):
            return r
        case .b(let e):
            throw e
        }
    }
}

func throwTo<T, R>(f: @escaping (T) throws -> R) -> (T) -> Either<R, Error> {
    return { t in
        do {
            return Either<R, Error>.a(try f(t))
        } catch (let e) {
            return Either<R, Error>.b(e)
        }
    }
}
