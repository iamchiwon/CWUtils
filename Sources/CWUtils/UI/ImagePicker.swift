//
//  ImagePicker.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import RxSwift
import UIKit

extension UIImagePickerController {
    public class func pickImage(on baseVC: UIViewController,
                                allowsEditing: Bool = true) -> Observable<UIImage> {
        
        let subject = PublishSubject<UIImage>()

        class InnerDelegate: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            weak var subject: PublishSubject<UIImage>?
            var allowsEditing = false

            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
                if allowsEditing,
                    let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                    subject?.onNext(editedImage)

                } else if !allowsEditing,
                    let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                    subject?.onNext(originalImage)
                }

                subject?.onCompleted()
                picker.dismiss(animated: true, completion: nil) // 5
            }

            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                subject?.onCompleted()
                picker.dismiss(animated: true, completion: nil)
            }
        }

        let innerDelegate = InnerDelegate()
        innerDelegate.subject = subject
        innerDelegate.allowsEditing = allowsEditing

        let picker = UIImagePickerController()
        picker.delegate = innerDelegate
        picker.allowsEditing = allowsEditing
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!

        baseVC.present(picker, animated: true, completion: nil)

        return Observable.zip(Observable.just(innerDelegate), subject.asObserver()) { $1 }
            .single()
    }
}
