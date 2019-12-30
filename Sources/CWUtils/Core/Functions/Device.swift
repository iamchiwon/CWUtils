//
//  Device.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import Foundation

public func runOnSimulatorOnly(_ runable: () -> ()) {
    if TARGET_IPHONE_SIMULATOR == 1 {
        runable()
    }
}

public func runOnDeviceOnly(_ runable: () -> ()) {
    if TARGET_IPHONE_SIMULATOR != 1 {
        runable()
    }
}

