//
//  Alert.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit

public func popupOK(on base: UIViewController,
                        title: String,
                        message: String?,
                        buttonTitle: String = "OK",
                        completion: (() -> ())? = nil) {

    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: UIAlertController.Style.alert)

    alert.addAction(UIAlertAction(title: buttonTitle.localized(),
                                  style: UIAlertAction.Style.default,
                                  handler: { _ in
                                      if let completion = completion {
                                          completion()
                                      }
                                  }))
    base.present(alert, animated: true, completion: nil)
}

public func popupOkCancel(on base: UIViewController,
                            title: String,
                            message: String,
                            okButtonTitle: String = "OK",
                            cancelButtonTitle: String = "Cancel",
                            onOk: @escaping () -> ()) {

    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: UIAlertController.Style.alert)

    alert.addAction( UIAlertAction(title: okButtonTitle.localized(),
                                   style: UIAlertAction.Style.default,
                                   handler: { _ in
                                       onOk()
                                   }))
    alert.addAction(UIAlertAction(title: cancelButtonTitle.localized(),
                                  style: UIAlertAction.Style.cancel,
                                  handler: nil))
    base.present(alert, animated: true, completion: nil)
}
