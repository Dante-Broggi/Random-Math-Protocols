//
//  Completeness.swift
//  WildMath
//
//  Created by Dante Broggi on 7/3/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///for all x and y in X it holds that xRy or yRx (or both)
public protocol Total: Reflexive {}

///for all x and y in X such that x ≠ y, xRy or xRy (or both)
public protocol Connexity: Relation where Left: Equatable {}

///for all x and y in X exactly one of xRy, yRx or x = y holds
public protocol Trichotomy: Relation where Left: Equatable {}
