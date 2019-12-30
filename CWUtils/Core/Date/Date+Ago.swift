//
//  Date+Ago.swift
//  CWUtils
//
//  Created by iamchiwon on 16/04/2019.
//

extension Date {
    
    public func ago() -> String {
        let seconds = self.timeIntervalSince1970
        let now = Date().timeIntervalSince1970
        let age = now - seconds
        if age < 10 { return "방금 전".localized() }
        if age < 60 { return "1분 전".localized() }
        if age < 60 * 60 { return "\(Int(age / 60))분 전".localized() }
        if age < 60 * 60 * 24 { return "\(Int(age / 60 / 60))시간 전".localized() }
        if age < 60 * 60 * 24 * 30 { return "\(Int(age / 60 / 60 / 24))일 전".localized() }
        if age < 60 * 60 * 24 * 30 * 12 { return "\(Int(age / 60 / 60 / 24 / 30))달 전".localized() }
        return "\(Int(age / 60 / 60 / 24 / 30 / 12))년 전".localized()
    }
    
    public func remain() -> String {
        let seconds = self.timeIntervalSince1970
        let now = Date().timeIntervalSince1970
        var remains = Int(seconds - now)
        if remains <= 0 { return "" }
        
        var dayString = ""
        
        let sec = remains % 60
        remains /= 60
        
        let minutes = remains % 60
        remains /= 60
        
        let hour = remains % 24
        remains /= 24
        
        let days = remains
        
        if days == 1 {
            dayString = "1Day"
        } else if days > 1 {
            dayString = "\(days)Days"
        }
        
        return String(format: "%@ %02d:%02d:%02d", dayString, hour, minutes, sec)
    }
    
    public func remainKr() -> String {
        let seconds = self.timeIntervalSince1970
        let now = Date().timeIntervalSince1970
        var remains = Int(seconds - now)
        if remains <= 0 { return "" }
        
        let sec = remains % 60
        remains /= 60
        
        let minutes = remains % 60
        remains /= 60
        
        let hour = remains % 24
        remains /= 24
        
        let days = remains
        
        return String(format: "%d일 %02d시간 %02d분 %02d초", days, hour, minutes, sec)
    }
}

