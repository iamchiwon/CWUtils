//
//  View+Measure.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit

public extension CGRect {
    var x: CGFloat { return self.origin.x }
    var y: CGFloat { return self.origin.y }
    var centerX: CGFloat { return self.midX }
    var centerY: CGFloat { return self.midY }
    var center: CGPoint { return CGPoint(x: self.midX, y: self.midY) }
}

public extension UIView {
    var centerX: CGFloat { return self.center.x }
    var centerY: CGFloat { return self.center.y }
}

public extension UIView {
    func calcAbsoluteRectInScreen() -> CGRect {
        var rect = self.frame
        var superView = self.superview
        while(superView != nil) {
            let ssuperView = superView!.superview
            if ssuperView == nil { break }
            
            rect = superView!.convert(rect, to: ssuperView!)
            superView = ssuperView
        }
        return rect
    }
}
