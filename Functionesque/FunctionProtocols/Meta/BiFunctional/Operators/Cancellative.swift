//
//  Cancellable.swift
//  WildMath
//
//  Created by Dante Broggi on 6/13/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///for all b and c in M, a ∗ b = a ∗ c always implies that b == c.
///aka. functional or univalent
public protocol LeftCancellative: BiFunctor {
    
}

///for all b and c in M, b ∗ a = c ∗ a always implies that b == c.
///aka. injective
public protocol RightCancellative: BiFunctor {
    
}

///for all b and c in M, a ∗ b = a ∗ c always implies that b == c.
///for all b and c in M, b ∗ a = c ∗ a always implies that b == c.
/// aka  one-to-one 
public typealias Cancellative = LeftCancellative & RightCancellative 
