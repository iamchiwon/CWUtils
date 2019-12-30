//
//  Date+CWUtils.swift
//  CWUtils
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import Foundation

extension Date {
    
    public static func currentTimeInMilli() -> Int {
        return Date().timeInMilli()
    }
    
    public func timeInMilli() -> Int {
        return Int(self.timeIntervalSince1970 / 1000.0)
    }
    
    init(milli: UInt64) {
        self.init(timeIntervalSince1970: (TimeInterval(milli) / 1000.0))
    }
}
