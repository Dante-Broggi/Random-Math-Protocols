//
//  SemiLattice.swift
//  WildMath
//
//  Created by Dante Broggi on 6/27/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public typealias SemiLattice<O : Associtive & Commutative & BiIdempotent> = SemiGroup<O>

public typealias BoundedSemiLattice<O : Associtive & Commutative & BiIdempotent & HasIdentity> = SemiLattice<O>
