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
                        completion: (() -> ())? = nil) {

    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: UIAlertController.Style.alert)

    alert.addAction(UIAlertAction(title: "OK".localized(),
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
                            onOk: @escaping () -> ()) {

    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: UIAlertController.Style.alert)

    alert.addAction( UIAlertAction(title: "OK".localized(),
                                   style: UIAlertAction.Style.default,
                                   handler: { _ in
                                       onOk()
                                   }))
    alert.addAction(UIAlertAction(title: "Cancel".localized(),
                                  style: UIAlertAction.Style.cancel,
                                  handler: nil))
    base.present(alert, animated: true, completion: nil)
}
