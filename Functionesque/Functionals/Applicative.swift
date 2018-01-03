//
//  Applicative.swift
//  SwiftyAlpha
//
//  Created by Dante Broggi on 7/23/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

extension Optional {
  func apply<U>(f: ((Wrapped) -> U)?) -> U? {
    switch f {
    case .some(let someF): return self.map(someF)
    case .none: return .none
    }
  }
}

extension Array {
  func apply<U>(fs: [(Element) -> U]) -> [U] {
    var result = [U]()
      for f in fs {
        for element in self.map(f) {
          result.append(element)
        }
      }
      return result
    }
}
