//
//  View+IB.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit

@IBDesignable extension UIView {

    @IBInspectable public var borderColor: UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
                else {
                    return nil
            }
        }
    }

    @IBInspectable public var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable public var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable public var shadowColor: UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
                else {
                    return nil
            }
        }
    }

    @IBInspectable public var shadowOpacity: Float {
        set {
            layer.shadowOpacity = newValue
        }
        get {
            return layer.shadowOpacity
        }
    }

    @IBInspectable public var masksToBounds: Bool {
        set {
            layer.masksToBounds = newValue
        }
        get {
            return layer.masksToBounds
        }
    }

    @IBInspectable public var shadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }

    @IBInspectable public var shadowOffset: CGSize {
        set {
            layer.shadowOffset = newValue
        }
        get {
            return layer.shadowOffset
        }
    }

    public var isShown: Bool {
        get {
            return !self.isHidden
        }
        set {
            self.isHidden = !newValue
        }
    }
}
