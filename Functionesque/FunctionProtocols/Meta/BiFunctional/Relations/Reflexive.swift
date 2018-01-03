//
//  Reflexive.swift
//  WildMath
//
//  Created by Dante Broggi on 6/13/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///A relation R is reflexive provided that aRa is `true` for all a.
public protocol Reflexive: Serial {}

///A relation R is irreflexive provided that aRa is `false` for all a.
public protocol Irreflexive: Relation {}

///A relation R is coreflexive provided that if aRb is `true` then a == b
public protocol Coreflexive: Relation where Left: Equatable {}
