//
//  Idempotent.swift
//  WildMath
//
//  Created by Dante Broggi on 6/28/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///f(a...) == a
public protocol Idempotent {}

///(a^)^ == a^
public protocol MonoIdempotent: Idempotent, MonoFunctor {}
