//
//  Incomparability.swift
//  WildMath
//
//  Created by Dante Broggi on 7/3/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///For all x, y, z in S, if x is incomparable with y
///  (neither xRy nor yRx hold),
/// and y is incomparable with z, then x is incomparable with z
public protocol HasTransitiveityOfIncomparability: Relation {}

/// `~` is the incomparability relation of R i.e. x~y iff neither xRy nor yRx
///For all x, y, z, and w, if it is true that xRy, y ~ z, and zRw,
/// then it must also be true that xRw.
///For all x, y, z, and w, if it is true that xRy, yRz, and y ~ w,
/// then it cannot also be true that x ~ w and z ~ w simultaneously.
public protocol SemiOrder: Irreflexive, AntiSymmetric, Transitive {}
