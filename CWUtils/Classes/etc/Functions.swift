//
//  Functions.swift
//  CWUtils
//
//  Created by iamchiwon on 2018. 9. 18..
//

import Foundation

public let i2s: (Int) -> String = { "\($0)" }

public func bypass<A>(_ a: A) -> A {
    return a
}

public func invert(_ a: Bool) -> Bool {
    return !a
}

public func isZero(_ a: Int) -> Bool {
    return a == 0
}

public func isNotZero(_ a: Int) -> Bool {
    return a != 0
}

public func isEmpty(_ a: String?) -> Bool {
    return a?.isEmpty ?? true
}

public func isNotEmpty(_ a: String?) -> Bool {
    return !isEmpty(a)
}
