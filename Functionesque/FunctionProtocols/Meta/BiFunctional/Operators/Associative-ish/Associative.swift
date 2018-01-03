//
//  Associative.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///Associativity: (a • b) • c === a • (b • c)
public protocol Associtive: Alternative, Jordan, LeftBol, RightBol {}
