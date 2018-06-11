//
//  Collection.swift
//  d.code
//
//  Created by iamchiwon on 2017. 8. 24..
//  Copyright © 2017년 n.code. All rights reserved.
//

import Foundation

extension MutableCollection where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleMe() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
}

extension Collection {
    /// Return a copy of `self` with its elements shuffled
    func shuffled() -> [Iterator.Element] {
        var list = Array(self)
        list.shuffleMe()
        return list
    }
}
