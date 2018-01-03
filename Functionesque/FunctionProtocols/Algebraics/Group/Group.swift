//
//  AdditiveGroup.swift
//  WildMath
//
//  Created by Dante Broggi on 6/13/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public typealias MonoidGroup<O : Associtive & Invertable> = Monoid<O>
public typealias LoopGroup<O : Associtive & Invertable> = Loop<O>

public typealias Group<O : Associtive & Invertable> =  Loop<O> // & Monoid<O>
