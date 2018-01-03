//
//  Integral.swift
//  WildMath
//
//  Created by Dante Broggi on 7/5/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///Integrals should satisfy these properties (area properties):

/// Linearity:
/// ᵣ∫ⁿ (f(x) + g(x))dx === ᵣ∫ⁿ f(x)dx + ᵣ∫ⁿ g(x)dx
/// ᵣ∫ⁿ (k * f(x))dx === k * ᵣ∫ⁿ f(x)dx

///Additivity:
///ᵣ∫ⁿ f(x)dx + ⁿ∫ⁱ f(x)dx === ᵣ∫ⁱ f(x)dx

///Translation Invariance:
///ᵣ∫ⁿ f(x + c)dx === ᵣ₊c∫ⁿ⁺c f(x)dx

///Scale Invariance:
///c * ᵣ∫ⁿ f(c * x)dx === ᵣₓc∫ⁿ*c f(x)dx

///Normalization: {1}(x) === 1 for all x
///₀∫¹ {1}(x)dx === 1
