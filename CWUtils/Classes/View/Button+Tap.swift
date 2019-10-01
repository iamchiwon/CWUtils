//
//  View+IB.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import RxSwift
import UIKit

public extension UIButton {
    func whenTouchUpInside(throttle dueTime: TimeInterval = 0.3) -> Observable<UIButton> {
        return rx.tap.asDriver()
            .throttle(.milliseconds(Int(dueTime * 1000)), latest: false)
            .map({ self })
            .asObservable()
    }
}
