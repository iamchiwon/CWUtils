//
//  CWViewController.swift
//  CWUtils
//
//  Created by Chiwon Song on 2019/12/29.
//

import RxSwift
import UIKit

@objc public protocol CWViewControllerCustomizable {
    @objc optional func setupViews()
    @objc optional func setupBinds()
}

open class CWViewController: UIViewController, CWViewControllerCustomizable {
    open var disposeBag = DisposeBag()

    open override func viewDidLoad() {
        super.viewDidLoad()
        _setupViews()
        _setupBinds()
    }

    open override func willMove(toParent parent: UIViewController?) {
        if parent == nil {
            disposeBag = DisposeBag()
        }
        super.willMove(toParent: parent)
    }

    func push(to vc: UIViewController, animated: Bool = true) {
        if let navi = navigationController {
            navi.pushViewController(vc, animated: animated)
            return
        } else {
            present(vc, animated: animated, completion: nil)
        }
    }

    func pop(animated: Bool = true) {
        if let presenting = presentingViewController {
            presenting.dismiss(animated: animated, completion: nil)
            return
        } else if let navi = navigationController {
            navi.popViewController(animated: animated)
        }
    }

    private func _setupViews() {
        view.backgroundColor = UIColor.sysBackground
        (self as CWViewControllerCustomizable).setupViews?()
    }

    private func _setupBinds() {
        view.addTapGestureRecognizer()
            .subscribe(onNext: { $0.view?.endEditing(true) })
            .disposed(by: disposeBag)
        (self as CWViewControllerCustomizable).setupBinds?()
    }
}
