//
//  Anihilator.swift
//  WildMath
//
//  Created by Dante Broggi on 7/4/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///Annialation: There exists an element O in A,
///such that for all elements a in A, the equation O • a = O holds.
public protocol HasLeftAnnialator: Operator {
	static var annialator: Return { get }
}

///Annialation: There exists an element O in A,
///such that for all elements a in A, the equation a • O = O holds.
public protocol HasRightAnnialator: Operator {
	static var annialator: Return { get }
}

///Annialation: There exists an element O in A,
///such that for all elements a in A, the equation O • a = a • O = O holds.
public typealias HasAnnialator = HasLeftAnnialator & HasRightAnnialator
