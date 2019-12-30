//
//  Array+Equtable.swift
//  d.code
//
//  Created by iamchiwon on 2017. 12. 26..
//  Copyright © 2017년 n.code. All rights reserved.
//

import Foundation

extension Encodable {

    public func dictionary() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            let serialized = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let dictionary = serialized as? [String: Any] {
                return dictionary
            }
            return [:]
        } catch let e {
            ELog(e.localizedDescription)
            return [:]
        }
    }

    public func json() -> String {
        do {
            let data = try JSONEncoder().encode(self)
            if let json = String(data: data, encoding: .utf8) {
                return json
            }
            return "{}"
        } catch let e {
            ELog(e.localizedDescription)
            return "{}"
        }
    }
}

extension Dictionary {

    public func decode<T>() -> T? where T: Decodable {
        do {
            return try JSONDecoder().decode(T.self, from: self.json().data(using: .utf8)!)
        } catch let e {
            ELog(e.localizedDescription)
            return nil
        }
    }

    public func json() -> String {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            if let json = String(data: data, encoding: .utf8) {
                return json
            }
            return "{}"
        } catch let e {
            ELog(e.localizedDescription)
            return "{}"
        }
    }
}
