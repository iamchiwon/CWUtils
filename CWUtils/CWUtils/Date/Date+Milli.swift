//
//  Date+CWUtils.swift
//  CWUtils
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import Foundation

extension Date {
    
    open static func currentTimeInMilli() -> Int {
        return Date().timeInMilli()
    }
    
    open func timeInMilli() -> Int {
        return Int(self.timeIntervalSince1970 / 1000.0)
    }
    
}
