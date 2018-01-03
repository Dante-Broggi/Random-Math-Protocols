//
//  Parity.swift
//  WildMath
//
//  Created by Dante Broggi on 7/2/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

/// f(x) == f(-x)
public protocol EvenParity: MonoFunctor where Self.Input: Negatable {}

/// -f(x) == f(-x)
public protocol OddParity: MonoFunctor where Self.Input: Negatable, Self.Return: Negatable {}
