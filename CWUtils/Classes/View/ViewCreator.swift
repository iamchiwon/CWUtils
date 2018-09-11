//
//  ViewCreator.swift
//  d.code
//
//  Created by iamchiwon on 2018. 3. 6..
//  Copyright © 2018년 n.code. All rights reserved.
//

import SnapKit
import UIKit

@discardableResult
public func createView<T>(_ view: T,
                   parent: UIView?,
                   setting: ((T) -> Void)? = nil,
                   constraint: ((ConstraintMaker) -> Void)? = nil) -> T where T: UIView {
    
    switch parent {
    case let stack as UIStackView:
        stack.addArrangedSubview(view)
    case let collectionCell as UICollectionViewCell:
        collectionCell.contentView.addSubview(view)
    case let tableCell as UITableViewCell:
        tableCell.contentView.addSubview(view)
    default:
        parent?.addSubview(view)
    }
    
    if let setting = setting {
        setting(view)
    }
    
    if let constraint = constraint {
        view.snp.makeConstraints(constraint)
    }
    return view
}

extension ConstraintMaker {
    public func aspectRatio(_ x: Int, by y: Int, self instance: ConstraintView) {
        self.width.equalTo(instance.snp.height).multipliedBy(x / y)
    }
}
