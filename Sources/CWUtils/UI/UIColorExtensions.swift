//
//  UIColorExtensions.swift
//  CWUtils
//
//  Created by Chiwon Song on 2019/12/29.
//

import UIKit

public extension UIColor {
    static var sysBackground: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemBackground
        } else {
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }()

    static var sysLabel: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.label
        } else {
            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }()

    static var sysBlue: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemBlue
        } else {
            return #colorLiteral(red: 0, green: 0.4793452024, blue: 0.9990863204, alpha: 1)
        }
    }()

    static var sysGreen: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemGreen
        } else {
            return #colorLiteral(red: 0.2036584318, green: 0.7829266191, blue: 0.3481193781, alpha: 1)
        }
    }()

    static var sysIndigo: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemIndigo
        } else {
            return #colorLiteral(red: 0.3459055424, green: 0.3397476971, blue: 0.8399652839, alpha: 1)
        }
    }()

    static var sysOrange: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemOrange
        } else {
            return #colorLiteral(red: 1, green: 0.5865499377, blue: 0, alpha: 1)
        }
    }()

    static var sysPink: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemPink
        } else {
            return #colorLiteral(red: 1, green: 0.1786963046, blue: 0.3346384168, alpha: 1)
        }
    }()

    static var sysPurple: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemPurple
        } else {
            return #colorLiteral(red: 0.6871816516, green: 0.3226081729, blue: 0.8700770736, alpha: 1)
        }
    }()

    static var sysRed: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemRed
        } else {
            return #colorLiteral(red: 0.9990618825, green: 0.2337017655, blue: 0.1887318194, alpha: 1)
        }
    }()

    static var sysTeal: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemTeal
        } else {
            return #colorLiteral(red: 0.3548746705, green: 0.7854425311, blue: 0.9815476537, alpha: 1)
        }
    }()

    static var sysYellow: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemYellow
        } else {
            return #colorLiteral(red: 1, green: 0.8014437556, blue: 0.004643389955, alpha: 1)
        }
    }()

    static var sysGray: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemGray
        } else {
            return #colorLiteral(red: 0.556738019, green: 0.5565260053, blue: 0.577188611, alpha: 1)
        }
    }()

    static var sysGray2: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemGray2
        } else {
            return #colorLiteral(red: 0.6822280884, green: 0.6821004748, blue: 0.6985904574, alpha: 1)
        }
    }()

    static var sysGray3: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemGray3
        } else {
            return #colorLiteral(red: 0.7802448869, green: 0.7800709605, blue: 0.8006975055, alpha: 1)
        }
    }()

    static var sysGray4: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemGray4
        } else {
            return #colorLiteral(red: 0.8194566369, green: 0.8192892671, blue: 0.8399093747, alpha: 1)
        }
    }()

    static var sysGray5: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemGray5
        } else {
            return #colorLiteral(red: 0.8978799582, green: 0.8977256417, blue: 0.9183328748, alpha: 1)
        }
    }()

    static var sysGray6: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemGray6
        } else {
            return #colorLiteral(red: 0.9488552213, green: 0.9487094283, blue: 0.9693081975, alpha: 1)
        }
    }()
}
