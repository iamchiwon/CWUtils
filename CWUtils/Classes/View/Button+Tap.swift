//
//  View+IB.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit
import RxSwift

extension UIButton {

    public func whenTouchUpInside(throttle dueTime: TimeInterval = 0.3) -> Observable<UIButton> {
        return self.rx.tap.asDriver()
            .throttle(dueTime, latest: false)
            .map({ self })
            .asObservable()
    }
}
