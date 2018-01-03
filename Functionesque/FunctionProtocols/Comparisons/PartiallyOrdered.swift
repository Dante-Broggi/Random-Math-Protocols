//
//  PartiallyOrdered.swift
//  WildMath
//
//  Created by Dante Broggi on 6/13/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

protocol PartiallyOrdered {
    associatedtype PartialOrderer: PartialOrder //= RelationFunctor<Self>
    static var partialOrderer: PartialOrderer { get }
}

//extension Comparable where PartialOrderer == RelationFunctor<Self> {
//    static var equator: partialOrderer {
//        return RelationFunctor(function: ((<=) as (Self, Self) -> Bool))
//    }
//}
