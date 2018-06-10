//
//  Collection.swift
//  d.code
//
//  Created by iamchiwon on 2017. 8. 24..
//  Copyright © 2017년 n.code. All rights reserved.
//

import Foundation

extension Collection {
    /// Return a copy of `self` with its elements shuffled
    func shuffled() -> [Iterator.Element] {
        var list = Array(self)
        list.shuffle()
        return list
    }
}
