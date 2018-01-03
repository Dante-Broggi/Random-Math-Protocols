//
//  Functionals.swift
//  SwiftyAlpha
//
//  Created by Dante Broggi on 7/23/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

func ifNonNil<T, U, R>(check: @escaping (T, U) -> R, otherwise: @escaping (T) -> R) -> (T, U?) -> R {
    return { a, o in
        if let b = o {
            return check(a, b)
        } else {
            return otherwise(a)
        }
    }
}

func conditionalize<R, T>(_ t: T, with check: (T) -> Bool, in f: (T) -> R) -> Either<R, T> {
    if check(t) {
        return .a(f(t))
    } else {
        return .b(t)
    }
}

func conditionalize<R, T>(with check: @escaping (T) -> Bool, in f: @escaping (T) -> R) -> (T) -> Either<R, T> {
    return { t in
        if check(t) {
            return .a(f(t))
        } else {
            return .b(t)
        }
    }
}

func joinSingily<T>(_ t: T, to arr: [T], if compare: (T, _ other: T?) -> Bool) -> [T] {
    let last = arr.last
    if compare(t, last) {
        return arr + [t]
    } else {
        return arr
    }
}

func joinDoubily<T>(t: T, to arr: [[T]], if check: (T, T) -> Bool) -> [[T]] {
    //    print("joining \(t) to \(arr)")
    
    if let OuterLast = arr.last {
        if let InnerLast = OuterLast.last {
            if check(t, InnerLast) {
                return arr.replacingLast(with: { e in (e ?? []).appending(t) })
            } else {
                return arr.appending([t])
            }
        } else {
            return arr.replacingLast(with: {_ in  [t] })
        }
    } else {
        return [[(t)]]
    }
}
