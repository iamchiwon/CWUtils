//
//  DLog.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import Foundation

public func ELog<T>(_ message: T, function: String = #function, line:Int = #line) {
    if let text = message as? String {
        print("\(function)(\(line)): \(text)")
    }
}

public func DLog<T>(_ message: T, function: String = #function, line:Int = #line) {
    #if DEBUG
        if let text = message as? String {
            print("\(function)(\(line)): \(text)")
        }
    #endif
}
