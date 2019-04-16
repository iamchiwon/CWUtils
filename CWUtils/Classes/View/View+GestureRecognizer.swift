//
//  View+Touch.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import RxSwift
import UIKit

public extension UIView {
    func addTapGestureRecognizer(_ numberOfTapsRequired: Int = 1) -> Observable<UITapGestureRecognizer> {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.numberOfTapsRequired = numberOfTapsRequired
        isUserInteractionEnabled = true
        addGestureRecognizer(tapGesture)
        return tapGesture.rx.event.asDriver().asObservable()
    }

    func addSwipeGestureRecognizer() -> Observable<UISwipeGestureRecognizer> {
        let swipeGesture = UISwipeGestureRecognizer()
        isUserInteractionEnabled = true
        addGestureRecognizer(swipeGesture)
        return swipeGesture.rx.event.asDriver().asObservable()
    }
}
