//
//  String+Validation.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import Foundation

public enum ValidationType: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
}

extension String {

    public func isValid(withRegEx regex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }

    public func isValid(withType type: ValidationType) -> Bool {
        return isValid(withRegEx: type.rawValue)
    }

}
