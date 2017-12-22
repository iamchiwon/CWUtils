//
//  View+Measure.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit

extension UIView {

    public func calcAbsoluteRectInScreen() -> CGRect {
        var rect = self.frame
        var superView = self.superview
        while(superView != nil) {
            let ssuperView = superView!.superview;
            if ssuperView == nil { break }

            rect = superView!.convert(rect, to: ssuperView!)
            superView = ssuperView
        }
        return rect
    }

}
