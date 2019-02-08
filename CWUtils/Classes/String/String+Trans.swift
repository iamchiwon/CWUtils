//
//  String+Trans.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import Foundation

extension String {
    public func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    public func url() -> URL {
        if let url = URL(string: self) {
            return url
        }
        if let urlString = self.trim().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: urlString) {
            return url
        }
        return NSURLComponents().url! // empty url
    }

    public func base64() -> String {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return self
    }

    public func localized() -> String {
        return NSLocalizedString(self, comment: self)
    }

    public func replace(_ originalString: String, with newString: String) -> String {
        return self.replacingOccurrences(of: originalString, with: newString)
    }
    
    public static var uuid: String {
        return UUID().uuidString
    }
}
