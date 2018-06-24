//
//  Date+Format.swift
//  CWUtils
//
//  Created by iamchiwon on 2017. 12. 22..
//

import Foundation

extension Date {
    
    public static func fromFormat(_ format: String) -> (String) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format
        df.locale = Locale(identifier: "en_US_POSIX")
        return { dateString in
            guard !dateString.isEmpty else { return nil }
            return df.date(from: dateString)
        }
    }
    
    public func formatted(_ format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        df.locale = Locale(identifier: "en_US_POSIX")
        return df.string(from: self)
    }
    
}
