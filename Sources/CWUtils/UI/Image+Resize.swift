//
//  Image+Resize.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit

public extension UIImage {
    func resizedToScreen() -> UIImage {
        return resized(maxSize: UIScreen.main.bounds.size)
    }

    func resized(maxSize: CGSize) -> UIImage {
        let horizontalRatio = maxSize.width / size.width
        let verticalRatio = maxSize.height / size.height

        let ratio = max(horizontalRatio, verticalRatio)
        if ratio >= 1.0 { return self }

        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
