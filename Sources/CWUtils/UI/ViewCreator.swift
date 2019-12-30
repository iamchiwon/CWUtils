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
    case let scrollView as UIScrollView:
        if let refresh = view as? UIRefreshControl {
            scrollView.refreshControl = refresh
        } else {
            scrollView.addSubview(view)
        }
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

@discardableResult
public func createVStack(parent: UIView?,
                  spacing: CGFloat = 0,
                  setting: ((UIStackView) -> Void)? = nil,
                  constraint: ((ConstraintMaker) -> Void)? = nil) -> UIStackView {
    return createView(UIStackView(), parent: parent, setting: { v in
        v.axis = .vertical
        v.distribution = .fillProportionally
        v.alignment = .leading
        v.spacing = spacing
        setting?(v)
    }, constraint: constraint)
}

@discardableResult
public func createHStack(parent: UIView?,
                  spacing: CGFloat = 0,
                  setting: ((UIStackView) -> Void)? = nil,
                  constraint: ((ConstraintMaker) -> Void)? = nil) -> UIStackView {
    return createView(UIStackView(), parent: parent, setting: { v in
        v.axis = .horizontal
        v.distribution = .fillProportionally
        v.alignment = .center
        v.spacing = spacing
        setting?(v)
    }, constraint: constraint)
}

@discardableResult
public func createSpacer(parent: UIView?,
                  width: CGFloat? = nil,
                  height: CGFloat? = nil) -> UIView {
    return createView(UIView(), parent: parent, setting: { v in
        v.backgroundColor = .clear
    }, constraint: { m in
        if let w = width { m.width.equalTo(w) }
        if let h = height { m.height.equalTo(h) }
    })
}

extension ConstraintMaker {
    public func aspectRatio(_ x: Int, by y: Int, self instance: ConstraintView) {
        self.width.equalTo(instance.snp.height).multipliedBy(x / y)
    }
}
