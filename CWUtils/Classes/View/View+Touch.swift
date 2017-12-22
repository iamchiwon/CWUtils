//
//  View+Touch.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension UIView {

    public func whenTouched(_ numberOfTapsRequired: Int = 1) -> Observable<UITapGestureRecognizer> {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.numberOfTapsRequired = numberOfTapsRequired
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
        return tapGesture.rx.event.asDriver().asObservable()
    }

}
