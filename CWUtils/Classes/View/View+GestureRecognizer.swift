//
//  View+Touch.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit
import RxSwift

extension UIView {

    public func addTapGestureRecognizer(_ numberOfTapsRequired: Int = 1) -> Observable<UITapGestureRecognizer> {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.numberOfTapsRequired = numberOfTapsRequired
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
        return tapGesture.rx.event.asDriver().asObservable()
    }

    public func addSwipeGestureRecognizer() -> Observable<UISwipeGestureRecognizer> {
        let swipeGesture = UISwipeGestureRecognizer()
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(swipeGesture)
        return swipeGesture.rx.event.asDriver().asObservable()
    }

}
