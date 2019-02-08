//
//  AttributeString+Style.swift
//  CWUtils
//
//  Created by iamchiwon on 09/02/2019.
//

import Foundation
import UIKit

extension NSAttributedString {
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple

        let attributedString = NSMutableAttributedString(attributedString: self)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSRange(location: 0, length: attributedString.length))

        return attributedString
    }

    public func striked(strikeColor: UIColor = UIColor.lightGray) -> NSAttributedString {
        let attributed = NSMutableAttributedString(attributedString: self)
        let stringRange = NSRange(location: 0, length: self.string.count)
        attributed.addAttribute(NSAttributedString.Key.baselineOffset, value: 0, range: stringRange)
        attributed.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: stringRange)
        attributed.addAttribute(NSAttributedString.Key.strikethroughColor, value: strikeColor, range: stringRange)
        return attributed
    }
    
    public func underlined() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        let stringRange = NSRange(location: 0, length: self.string.count)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: stringRange)
        return attributedString
    }
}
