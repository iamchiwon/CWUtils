//
//  Color+DarkMode.swift
//  CWUtils
//
//  Created by iamchiwon on 2019/12/10.
//

import UIKit

public func isDarkMode() -> Bool {
    if #available(iOS 13.0, *) {
        return UIScreen.main.traitCollection.userInterfaceStyle == .dark
    } else {
        return false
    }
}

extension UIColor {
    public static func darkableColor(_ color: UIColor, darkmode: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                traits.userInterfaceStyle == .dark ? darkmode : color
            }
        } else {
            return color
        }
    }
}

extension UIImage {
    public static func darkableImage(_ image: UIImage, darkmode: UIImage) -> UIImage {
        if #available(iOS 13.0, *) {
            image.imageAsset?.register(darkmode, with: UITraitCollection(userInterfaceStyle: .dark))
            return image
        } else {
            return image
        }
    }
}

extension UITraitCollection {
    func darkenized<T>(_ builder: @autoclosure () -> T) -> T {
        var image = builder()
        if #available(iOS 13.0, *) {
            performAsCurrent {
                image = builder()
            }
        }
        return image
    }
}
