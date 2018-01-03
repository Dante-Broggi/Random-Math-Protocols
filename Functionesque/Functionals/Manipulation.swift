//
//  Manipulation.swift
//  SwiftyAlpha
//
//  Created by Dante Broggi on 7/23/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

func map<T, U, V>(f1: @escaping (U) -> V, f2: @escaping (T) -> U) -> (T) -> V {
    return { f1(f2($0)) }
}

func commute<T, U, R>(_ f: @escaping (T, U) -> R) -> (U, T) -> R {
    return { u, t in
        f(t, u)
    }
}

func input<T, U, V, R>(t: T, into: @escaping (T, U, V) -> R) -> (U, V) -> R {
    return { u, v in
        into(t, u, v)
    }
}

func input<T, U, V, R>(u: U, into: @escaping (T, U, V) -> R) -> (T, V) -> R {
    return { t, v in
        into(t, u, v)
    }
}

func input<T, U, V, R>(v: V, into: @escaping (T, U, V) -> R) -> (T, U) -> R {
    return { t, u in
        into(t, u, v)
    }
}

func input<T, U, R>(t: T, into: @escaping (T, U) -> R) -> (U) -> R {
    return { u in
        into(t, u)
    }
}

func input<T, U, R>(u: U, into: @escaping (T, U) -> R) -> (T) -> R {
    return { t in
        into(t, u)
    }
}
