//
//  SemiGroup.swift
//  WildMath
//
//  Created by Dante Broggi on 6/25/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public typealias SemiGroup<O : Associtive> = Magma<O>

public typealias Band<O : Associtive & BiIdempotent> = SemiGroup<O>
