//
//  PandaExtension.swift
//  CWUtils
//
//  Created by iamchiwon on 2019/12/10.
//

import Panda
import SnapKit
import UIKit

extension PandaChain where Object: UIView {
    @discardableResult
    public func constraint(_ maker: (ConstraintMaker) -> Void) -> PandaChain {
        object.snp.makeConstraints(maker)
        return self
    }

    @discardableResult
    public func add(to parent: UIView?) -> PandaChain {
        switch parent {
        case let stack as UIStackView:
            stack.addArrangedSubview(object)
        case let collectionCell as UICollectionViewCell:
            collectionCell.contentView.addSubview(object)
        case let tableCell as UITableViewCell:
            tableCell.contentView.addSubview(object)
        case let scrollView as UIScrollView:
            if let refresh = object as? UIRefreshControl {
                scrollView.refreshControl = refresh
            } else {
                scrollView.addSubview(object)
            }
        default:
            parent?.addSubview(object)
        }
        return self
    }

    public var snp: ConstraintViewDSL {
        return object.snp
    }

    public var view: Object {
        return object
    }
}

public func VStack() -> PandaChain<UIStackView> {
    return UIStackView().pd.axis(.vertical)
}

public func VStackView() -> UIStackView {
    return VStack().view
}

public func HStack() -> PandaChain<UIStackView> {
    return UIStackView().pd.axis(.horizontal)
}

public func HStackView() -> UIStackView {
    return HStack().view
}
