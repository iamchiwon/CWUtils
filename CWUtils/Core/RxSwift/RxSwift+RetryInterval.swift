//
//  RxSwift+RetryInterval.swift
//  CWUtils
//
//  Created by iamchiwon on 16/04/2019.
//

import Foundation
import RxSwift
import RxSwiftExt

extension ObservableType {
    public func retryInterval(_ intervals: [RxTimeInterval], when f: @escaping (Error) -> Bool) -> Observable<Self.Element> {
        return retryWhen { error -> Observable<Int> in
            error.flatMap { e -> Observable<Void> in
                guard f(e) else { return .error(e) }
                return .just(())
            }
            .zip(with: Observable<RxTimeInterval>.from(intervals)) { $1 }
            .flatMap { Observable<Int>.timer($0, scheduler: Schedulers.background) }
        }
    }
}
