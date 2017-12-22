//
//  String+Measure.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit

extension String {

    public func calcHeight(forWidth: CGFloat, font: UIFont) -> CGFloat {

        let rect = CGSize(width: forWidth, height: .greatestFiniteMagnitude)
        let boundingRect = self.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingRect.height)
    }

    public func calcWidth(forHeight: CGFloat, font: UIFont) -> CGFloat {

        let rect = CGSize(width: .greatestFiniteMagnitude, height: forHeight)
        let boundingRect = self.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingRect.width)
    }
}

extension NSAttributedString {

    public func calcHeight(forWidth: CGFloat) -> CGFloat {

        let rect = CGSize(width: forWidth, height: .greatestFiniteMagnitude)
        let boundingRect = self.boundingRect(with: rect, options: .usesLineFragmentOrigin, context: nil)
        return ceil(boundingRect.height)
    }

    public func calcWidth(forHeight: CGFloat) -> CGFloat {

        let rect = CGSize(width: .greatestFiniteMagnitude, height: forHeight)
        let boundingRect = self.boundingRect(with: rect, options: .usesLineFragmentOrigin, context: nil)
        return ceil(boundingRect.width)
    }
}
