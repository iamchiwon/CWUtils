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
    public func size(_ size: CGSize) -> PandaChain {
        object.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        object.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self
    }

    @discardableResult
    public func size(_ size: CGFloat) -> PandaChain {
        object.widthAnchor.constraint(equalToConstant: size).isActive = true
        object.heightAnchor.constraint(equalToConstant: size).isActive = true
        return self
    }

    @discardableResult
    public func size(_ width: CGFloat, _ height: CGFloat) -> PandaChain {
        object.widthAnchor.constraint(equalToConstant: width).isActive = true
        object.heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }

    @discardableResult
    public func width(_ width: CGFloat) -> PandaChain {
        object.widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }

    @discardableResult
    public func height(_ height: CGFloat) -> PandaChain {
        object.heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }

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

    public func add<Parent>(to parent: PandaChain<Parent>) -> PandaChain where Parent: UIView {
        add(to: parent.view)
        return self
    }

    public var snp: ConstraintViewDSL {
        return object.snp
    }

    public var view: Object {
        return object
    }
}

public func VStack(alignment: UIStackView.Alignment = .leading,
                   spacing: CGFloat = 0,
                   distribution: UIStackView.Distribution = .equalSpacing) -> PandaChain<UIStackView> {
    return UIStackView().pd.axis(.vertical)
        .alignment(alignment)
        .spacing(spacing)
        .distribution(distribution)
}

public func HStack(alignment: UIStackView.Alignment = .center,
                   spacing: CGFloat = 0,
                   distribution: UIStackView.Distribution = .equalSpacing) -> PandaChain<UIStackView> {
    return UIStackView().pd.axis(.horizontal)
        .alignment(alignment)
        .spacing(spacing)
        .distribution(distribution)
}

public func Text(_ text: String = "") -> PandaChain<UILabel> {
    return UILabel().pd.text(text)
}

public func Image(_ image: UIImage? = nil) -> PandaChain<UIImageView> {
    return UIImageView().pd.image(image)
}

public func VStackView(alignment: UIStackView.Alignment = .leading,
                       spacing: CGFloat = 0,
                       distribution: UIStackView.Distribution = .equalSpacing) -> UIStackView {
    return VStack(alignment: alignment,
                  spacing: spacing,
                  distribution: distribution).view
}

public func HStackView(alignment: UIStackView.Alignment = .leading,
                       spacing: CGFloat = 0,
                       distribution: UIStackView.Distribution = .equalSpacing) -> UIStackView {
    return HStack(alignment: alignment,
                  spacing: spacing,
                  distribution: distribution).view
}

public func TextView(_ text: String = "") -> UILabel {
    return Text(text).view
}

public func ImageView(_ image: UIImage? = nil) -> UIImageView {
    return Image(image).view
}
