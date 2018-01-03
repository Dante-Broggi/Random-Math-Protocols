//
//  Realm.swift
//  WildMath
//
//  Created by Dante Broggi on 6/11/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

/// + (sum (of multiplicities)), ∪ (max), ∩ (min)
public protocol Realm: Additive, Unionable, Intersectable {}
