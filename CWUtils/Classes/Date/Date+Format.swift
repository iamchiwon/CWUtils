//
//  Date+Format.swift
//  CWUtils
//
//  Created by iamchiwon on 2017. 12. 22..
//

import Foundation

extension Date {
    
    public func formatted(_ format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: self)
    }
    
}
