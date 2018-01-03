//
//  Euclidean.swift
//  WildMath
//
//  Created by Dante Broggi on 7/3/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///for all a, b and c in X it holds that if aRb and aRc, then bRc
public protocol LeftEuclidean: Relation {}

///for all a, b and c in X it holds that if bRa and cRa, then bRc
public protocol RightEuclidean: Relation {}

public typealias Euclidean = LeftEuclidean & RightEuclidean 
