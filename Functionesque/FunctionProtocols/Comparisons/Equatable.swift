//
//  Equatable.swift
//  WildMath
//
//  Created by Dante Broggi on 6/13/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

protocol Equatible: Equatable {
    associatedtype Equator: Equivalence = EquatableRelator<Self>
    static var equator: Equator { get }
}
