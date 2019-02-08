//
//  Reusable+Rx.swift
//  CWUtils
//
//  Created by iamchiwon on 09/02/2019.
//

import Reusable
import RxSwift
import UIKit

extension Reactive where Base: UITableView {
    public func items<S: Sequence, T: UITableViewCell, O: ObservableType>(cellType: T.Type)
        -> (_ source: O)
        -> (_ configureCell: @escaping (Int, S.Iterator.Element, T) -> Void)
        -> Disposable
        where O.E == S, T: Reusable {
            return items(cellIdentifier: T.reuseIdentifier, cellType: cellType)
    }
}
