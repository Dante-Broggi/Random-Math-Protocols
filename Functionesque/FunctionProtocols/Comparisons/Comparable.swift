import Foundation//.CFComparisonResult

public typealias ComparisonResult = CFComparisonResult
infix operator <=> //: ComparisonPrecedence
//infix operator <==>: ComparisonPrecedence
///reurns `true` if lhs is not comparable to rhs
infix operator >!< //: ComparisonPrecedence

public protocol PartialCompareable: Comparable {
    /// Compares `lhs` and `rhs`
    static func <=> (lhs: Self, rhs: Self) -> ComparisonResult?
}

public extension PartialCompareable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return (lhs <=> rhs) == ComparisonResult.compareEqualTo
    }
    static func != (lhs: Self, rhs: Self) -> Bool {
        return (lhs <=> rhs) != ComparisonResult.compareEqualTo
    }
    static func < (lhs: Self, rhs: Self) -> Bool {
        return (lhs <=> rhs) == ComparisonResult.compareLessThan
    }
    static func > (lhs: Self, rhs: Self) -> Bool {
        return (lhs <=> rhs) == ComparisonResult.compareGreaterThan
    }
	static func <= (lhs: Self, rhs: Self) -> Bool {
		let comp = (lhs <=> rhs)
		return comp == ComparisonResult.compareLessThan || comp == ComparisonResult.compareEqualTo
	}
	static func >= (lhs: Self, rhs: Self) -> Bool {
		let comp = (lhs <=> rhs)
		return comp == ComparisonResult.compareGreaterThan || comp == ComparisonResult.compareEqualTo
	}
    static func >!< (lhs: Self, rhs: Self) -> Bool {
        return (lhs <=> rhs) == nil
    }
}

public protocol TotalCompareable: PartialCompareable {
    /// Compares `lhs` and `rhs`
    static func <=> (lhs: Self, rhs: Self) -> ComparisonResult
}

public extension TotalCompareable {
    /// Compares `lhs` and `rhs`
    static func <=> (lhs: Self, rhs: Self) -> ComparisonResult? {
        return ((lhs <=> rhs) as ComparisonResult)
    }
}

//Hashable: PartialComparable

public extension ComparisonResult {
	prefix static func ! (rhs: ComparisonResult) -> ComparisonResult {
		switch rhs {
		case .compareLessThan:
			return .compareGreaterThan
		case .compareEqualTo:
			return .compareEqualTo
		case .compareGreaterThan:
			return .compareLessThan
		}
	}
}
