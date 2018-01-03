//
//  DefaultDistributors.swift
//  WildMath
//
//  Created by Dante Broggi on 7/2/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

struct DefaultLeftDistributor<D: Operator, O: Operator>: LeftDistributor {
	typealias Distributed = D
	typealias DistributedOver = O
}

struct DefaultRightDistributor<D: Operator, O: Operator>: RightDistributor {
	typealias Distributed = D
	typealias DistributedOver = O
}
