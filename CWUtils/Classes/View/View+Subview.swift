//
//  View+Subview.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit

public extension UIView {
    func viewWithIdentifier(_ identifier: String) -> UIView? {
        if identifier == accessibilityIdentifier { return self }
        for v in subviews {
            let sub = v.viewWithIdentifier(identifier)
            if sub != nil { return sub }
        }
        return nil
    }

    func constraintWithIdentifier(_ identifier: String) -> NSLayoutConstraint? {
        var searchView: UIView? = self
        while searchView != nil {
            for constraint in searchView!.constraints as [NSLayoutConstraint] {
                if constraint.identifier == identifier {
                    return constraint
                }
            }
            searchView = searchView!.superview
        }
        return nil
    }

    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }

    func imageView(_ tag: Int) -> UIImageView? {
        return viewWithTag(tag) as? UIImageView
    }

    func label(_ tag: Int) -> UILabel? {
        return viewWithTag(tag) as? UILabel
    }

    func button(_ tag: Int) -> UIButton? {
        return viewWithTag(tag) as? UIButton
    }

    func textfield(_ tag: Int) -> UITextField? {
        return viewWithTag(tag) as? UITextField
    }
}
