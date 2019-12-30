//
//  URL+Convenient.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import Foundation

extension URL {
    
    public var queryItems: [String: String] {
        var params = [String: String]()
        return URLComponents(url: self, resolvingAgainstBaseURL: false)?
            .queryItems?
            .reduce([:], { (_, item) -> [String: String] in
                params[item.name] = item.value
                return params
            }) ?? [:]
    }
    
    public subscript(queryParam: String) -> String {
        guard let url = URLComponents(string: self.absoluteString) else { return "" }
        return url.queryItems?.first(where: { $0.name == queryParam })?.value ?? ""
    }
}
