//
//  Identity.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///Identity: There exists an element I in A,
///such that for all elements a in A, the equation I • a = a • I = a holds.
///may be more general?
public protocol HasIdentity: Operator {
    static var identity: Return { get }
}
