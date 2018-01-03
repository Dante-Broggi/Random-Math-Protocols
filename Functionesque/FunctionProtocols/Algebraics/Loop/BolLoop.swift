//
//  BolLoop.swift
//  WildMath
//
//  Created by Dante Broggi on 6/25/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///x ∗ (y ∗ (x ∗ z)) = (x ∗ (y ∗ x)) ∗ z
///for each x, y and z in Q (a left Bol loop)
public protocol LeftBol: Operator {}

///((z ∗ x) ∗ y) ∗ x = z ∗ ((x ∗ y) ∗ x)
///for each x, y and z in Q (a right Bol loop).
public protocol RightBol: Operator {}

public typealias LeftBolLoop<O: HasIdentity & Cancellative & LeftBol & PowerAssociative> = Loop<O>
public typealias RightBolLoop<O: HasIdentity & Cancellative & RightBol & PowerAssociative> = Loop<O>

///A loop that is both a left and right Bol loop is a Moufang loop.
///This is equivalent to any one of the following single Moufang identities holding for all x, y, z:
///
///x ∗ (y ∗ (x ∗ z)) = ((x ∗ y) ∗ x) ∗ z,
///z ∗ (x ∗ (y ∗ x)) = ((z ∗ x) ∗ y) ∗ x,
///(x ∗ y) ∗ (z ∗ x) = x ∗ ((y ∗ z) ∗ x), or
///(x ∗ y) ∗ (z ∗ x) = (x ∗ (y ∗ z)) ∗ x.
public typealias MoufangLoop<O: HasIdentity & Cancellative & LeftBol & RightBol & PowerAssociative>
    = LeftBolLoop<O> //& RightBolLoop<O>
/*

A Bol loop is a loop that satisfies either:

x ∗ (y ∗ (x ∗ z)) = (x ∗ (y ∗ x)) ∗ z
for each x, y and z in Q (a left Bol loop),

or else

((z ∗ x) ∗ y) ∗ x = z ∗ ((x ∗ y) ∗ x)
for each x, y and z in Q (a right Bol loop).

A loop that is both a left and right Bol loop is a Moufang loop.
 This is equivalent to any one of the following single Moufang identities holding for all x, y, z:

x ∗ (y ∗ (x ∗ z)) = ((x ∗ y) ∗ x) ∗ z,
z ∗ (x ∗ (y ∗ x)) = ((z ∗ x) ∗ y) ∗ x,
(x ∗ y) ∗ (z ∗ x) = x ∗ ((y ∗ z) ∗ x), or
(x ∗ y) ∗ (z ∗ x) = (x ∗ (y ∗ z)) ∗ x.

*/
