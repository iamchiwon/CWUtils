//
//  Keyboard.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public func whenKeyboardShowNotification() -> Observable<(CGFloat, TimeInterval)> {
    return NotificationCenter.default.rx
        .notification(UIResponder.keyboardWillShowNotification)
        .map({ notification -> (height: CGFloat, duration: TimeInterval) in
            let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
            let durationNumber = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber
            return (height: keyboardSize.cgRectValue.size.height, duration: durationNumber.doubleValue)
        })
}

public func whenKeyboardHideNotification() -> Observable<TimeInterval> {
    return NotificationCenter.default.rx
        .notification(UIResponder.keyboardWillHideNotification)
        .map({ notification -> TimeInterval in
            let durationNumber = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber
            return durationNumber.doubleValue
        })
}
