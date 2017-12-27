//
//  ViewController.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit
import RxSwift
import CWUtils

class ViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let currentTimInMilli: Int = Date.currentTimeInMilli()
        print(currentTimInMilli)

        let timeInMillie: Int = Date().timeInMilli()
        print(timeInMillie)

        /** IMAGE SET **/

        view.imageView(100)?.addTapGestureRecognizer()
            .flatMap({ [unowned self] _ in pickImageFromAlbum(on: self, withEdit: true) })
            .map({ original -> UIImage in
                let resized = original.resized(maxSize: CGSize(width: 100, height: 100))
                print("resized(100,100) : \(resized)")
                let resizedForScreen = original.resizedToScreen()
                print("resized(100,100) : \(resizedForScreen)")
                return resized
            })
            .subscribe(onNext: { [unowned self] resized in
                self.view.imageView(100)?.image = resized
            })
            .disposed(by: disposeBag)

        /** ACTION **/

        view.button(102)?.whenTouchUpInside()
            .subscribe(onNext: { [unowned self] button in
                guard let text = self.view.textfield(101)?.text else { return }

                if text.isValid(withType: .email) {
                    popupOK(on: self, title: "이메일", message: text)
                } else {
                    popupOK(on: self, title: "메시지", message: text)
                }
            })
            .disposed(by: disposeBag)

        self.view.textfield(101)?.rx.text
            .asObservable()
            .bind(to: view.label(201)!.rx.text)
            .disposed(by: disposeBag)

        /** INFOMATION SET **/

        let today = Date().formatted("YYYY-MM-dd")

        var deviceInfo = ""
        runOnSimulatorOnly {
            deviceInfo = "Simulator "
        }

        runOnDeviceOnly {
            deviceInfo = "Device "
        }

        let versionInfo = currentApplicationVersion()

        view.label(200)?.text = "\(today) / \(deviceInfo) / \(versionInfo)"

        /** KEYBOARD EVENT **/

        whenKeyboardShowNotification()
            .subscribe(onNext: { (keyboardHeight: CGFloat, duration: TimeInterval) in
                print("keyboard showing")
            })
            .disposed(by: disposeBag)

        whenKeyboardHideNotification()
            .subscribe(onNext: { (duration: TimeInterval) in
                print("keyboard hide")
            })
            .disposed(by: disposeBag)

        self.view.addTapGestureRecognizer()
            .subscribe(onNext: { [unowned self] _ in
                self.view.endEditing(true)
            })
            .disposed(by: disposeBag)

        /** VERSION CHECK **/

        checkVersion()
    }

    func checkVersion() {
        let needUpdate: Bool = isUpdateAvailable()
        if needUpdate {
            popupOkCancel(on: self, title: "업데이트", message: "업데이트가 필요합니다.", onOk: {
                let urlString = "itms-apps://itunes.apple.com/app/id0000000000"
                UIApplication.shared.openURL(URL(string: urlString)!)
            })
        } else {
            popupOK(on: self, title: "업데이트", message: "최신버전입니다.")
        }
    }
}

