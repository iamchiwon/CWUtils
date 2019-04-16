//
//  Color+hex.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(red: Int, green: Int, blue: Int, a: Int = 255) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: CGFloat(a) / 255.0)
    }
    
    public convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    public convenience init(rgba: Int) {
        self.init(
            red: (rgba >> 24) & 0xFF,
            green: (rgba >> 16) & 0xFF,
            blue: (rgba >> 8) & 0xFF,
            a: rgba & 0xFF
        )
    }
    
    public static func fromHexString(_ rgbHex: String) -> UIColor {
        return UIColor(rgb: Int.parseHex(rgbHex))
    }
}

extension Int {
    public static func parseHex(_ hex: String) -> Int {
        let h2i = { "0123456789ABCDEF".firstIndex(of: $0)?.utf16Offset(in: "") ?? 0 }
        return hex.uppercased().map(h2i).reduce(0, { val, i in val * 16 + i })
    }
}
