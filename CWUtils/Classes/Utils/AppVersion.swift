//
//  AppVersion.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import Foundation

public func isUpdateAvailable() -> Bool {

    guard let info = Bundle.main.infoDictionary,
        let currentVersion = info["CFBundleShortVersionString"] as? String,
        let identifier = info["CFBundleIdentifier"] as? String,
        let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(identifier)") else {
            //확인 불가
            return false
    }

    guard let data = try? Data(contentsOf: url) else {
        //확인 불가
        return false
    }

    guard let json = try? JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any] else {
        //확인 불가
        return false
    }

    if let json = json,
        let result = (json["results"] as? [Any])?.first as? [String: Any],
        let storeVersion = result["version"] as? String {
        //확인 결과
        return (storeVersion.compare(currentVersion, options: .numeric) == .orderedDescending)
    }

    //확인 불가
    return false
}

