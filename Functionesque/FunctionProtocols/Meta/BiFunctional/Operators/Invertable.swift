//
//  Invertable.swift
//  WildMath
//
//  Created by Dante Broggi on 6/12/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

///Inverse: For some a in A, there exists an element b in A such that b • a = I, where I is the identity element.
///may be more general?
public protocol PartialLeftInvertable: HasIdentity {
    func invertLeft(_: Right) -> Left?
}

///Inverse: For some a in A, there exists an element b in A such that a • b = I, where I is the identity element.
///may be more general?
public protocol PartialRightInvertable: HasIdentity {
    func invertRight(_: Left) -> Right?
}

///Inverse: For some a in A, there exists an element b in A such that a • b = b • a = I,
/// where I is the identity element.
///may be more general?
public protocol PartialInvertable: PartialLeftInvertable, PartialRightInvertable {
    func invert(_: Return) -> Return?
}
public extension PartialInvertable {
	func invertRight(_ x: Return) -> Return? {
		return invert(x)
	}
	func invertLeft(_ x: Return) -> Return? {
		return invert(x)
	}
}

///Inverse: For some a in A, there exists an element b in A such that b • a = I, where I is the identity element.
///may be more general?
public protocol LeftInvertable: PartialLeftInvertable, LeftCancellative {
	func invertLeft(_: Right) -> Left
}
public extension LeftInvertable {
	func invertLeft(_ x: Return) -> Return? {
		return (invertLeft(x) as Return)
	}
}

///Inverse: For some a in A, there exists an element b in A such that a • b = I, where I is the identity element.
///may be more general?
public protocol RightInvertable: PartialRightInvertable, RightCancellative {
	func invertRight(_: Left) -> Right
}
public extension RightInvertable {
	func invertRight(_ x: Return) -> Return? {
		return (invertRight(x) as Return)
	}
}

///Inverse: For each a in A, there exists an element b in A such that a • b = b • a = I,
/// where I is the identity element.
///may be more general?
///"A left-invertible element is left-cancellative, and analogously for right and two-sided."
public protocol Invertable: PartialInvertable, LeftInvertable, RightInvertable {
    func invert(_: Return) -> Return
}

public extension Invertable {
    func invert(_ x: Return) -> Return? {
        return (invert(x) as Return)
    }
}
