//
//  Image+Rx.swift
//  CWUtils
//
//  Created by iamchiwon on 16/04/2019.
//

import Kingfisher
import Photos
import RxCocoa
import RxSwift
import UIKit

func rxLoadImage(_ url: URL) -> Observable<UIImage?> {
    return Observable.create { emitter in
        KingfisherManager.shared.retrieveImage(with: url,
                                               completionHandler: { result in
                                                   switch result {
                                                   case let .success(imageData):
                                                       emitter.onNext(imageData.image)
                                                       emitter.onCompleted()
                                                   case let .failure(error):
                                                       emitter.onError(error)
                                                   }
        })
        return Disposables.create()
    }
}

func rxSaveImage(_ image: UIImage) -> Observable<String?> {
    return PhotoWriter.save(image)
}

private class PhotoWriter: NSObject {
    typealias Callback = (PhotoWriter, NSError?) -> Void
    let disposeBag = DisposeBag()

    private var callback: Callback
    init(callback: @escaping Callback) {
        self.callback = callback
    }

    static func save(_ image: UIImage) -> Observable<String?> {
        return Observable<String?>.create { observer in
            let writer = PhotoWriter(callback: { writer, error in
                if let error = error {
                    observer.onError(error)
                } else {
                    observer.onNext(writer.latestAssetId())
                    observer.onCompleted()
                }
            })

            UIImageWriteToSavedPhotosAlbum(image, writer, #selector(PhotoWriter.image(_: didFinishSavingWithError: contextInfo:)), nil)

            return Disposables.create()
        }
    }

    private func latestAssetId() -> String? {
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let result = PHAsset.fetchAssets(with: .image, options: options)

        var assetToShare: PHAsset?
        result.enumerateObjects { asset, _, stop in
            assetToShare = asset
            stop.pointee = true
        }

        return assetToShare?.localIdentifier
    }

    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo info: UnsafeRawPointer) {
        callback(self, error)
    }
}
