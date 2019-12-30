//
//  Array+Equtable.swift
//  d.code
//
//  Created by iamchiwon on 2017. 12. 26..
//  Copyright © 2017년 n.code. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {

    public func exists(_ item: Element) -> Bool {
        if let _ = self.indexOf(item) {
            return true
        }
        return false
    }

    public func indexOf(_ item: Element) -> Int? {
        return self.enumerated().filter({ $0.element == item }).map({ $0.offset }).first
    }

    public mutating func remove(item: Element) -> Element? {
        if let index = indexOf(item) {
            return self.remove(at: index)
        }
        return nil
    }

    public func removed(_ item: Element) -> [Element] {
        return self.filter({ $0 != item })
    }
    
    public func findAndReplace(_ selector: (Element) -> Bool,
                               replaceWith: (Element) -> Element) -> [Element] {
        return map { item in selector(item) ? replaceWith(item) : item }
    }
}
