//
//  Copying.swift
//  DrawTesting
//
//  Created by Dante Broggi on 10/8/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

/*
 Linear type systems (allow exchange, not weakening or contraction):
         Every variable is used exactly once.
         - moveonly
         - consuming / owned
         * explicit disposal
 Affine type systems (allow exchange and weakening, not contraction):
         Every variable is used at most once.
         - consuming / owned
 Relevant type systems (allow exchange and contraction, not weakening):
         Every variable is used at least once.
         - consuming / owned
         * explicit disposal
 Ordered type systems (discard exchange, contraction and weakening):
         Every variable is used exactly once in the order it was introduced.
*/

func absorption<P, Q> (_ x: @escaping (P) -> Q) -> (P) -> And<P, Q> {
    return { p in
        return And(p, x(p))
    }
}

//class TestDeinit {
//    init() {}
//    ///Not yet possible
//    private deinit {
//        print("Testing Deinit...")
//    }
//}
