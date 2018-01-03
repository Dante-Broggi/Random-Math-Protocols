//
//  Arrays.swift
//  SwiftyAlpha
//
//  Created by Dante Broggi on 7/23/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

extension RangeReplaceableCollection {
    func appending(_ element: Element) -> Self {
        var tmp = self
        tmp.append(element)
        return tmp
    }
    func appending<S: Sequence>(contentsOf sequence: S) -> Self where S.Iterator.Element == Element {
        var tmp = self
        tmp.append(contentsOf: sequence)
        return tmp
    }
}

extension Array {
    mutating func replaceLast(with: (Element?) -> Element) {
        let last = popLast()
        append(with(last))
    }
    func replacingLast(with: (Element?) -> Element) -> [Element] {
        var tmp = self
        tmp.replaceLast(with: with)
        return tmp
    }
}
