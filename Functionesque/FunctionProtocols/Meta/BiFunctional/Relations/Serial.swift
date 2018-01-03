//
//  Serial.swift
//  WildMath
//
//  Created by Dante Broggi on 7/3/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///for all x in X, there exists y in X such that yRx
public protocol LeftSerial: Relation {}

///for all x in X, there exists y in X such that xRy
public protocol RightSerial: Relation {}

///for all x in X, there exists y in X such that xRy and (x,y) such that yRx
public protocol Serial: LeftSerial, RightSerial {}
