//
//  ScrollView+More.swift
//  CWUtils
//
//  Created by iamchiwon on 2018. 2. 14..
//

import UIKit
import RxSwift
import RxCocoa

extension UIScrollView {
    
    func needsMore() -> Observable<UIScrollView> {
        return self.rx.didScroll.map { _ in self }
            .filter {
                let offsetY = $0.contentOffset.y
                let scrollerHeight = $0.bounds.size.height
                let scrollRemain = $0.contentSize.height - offsetY - scrollerHeight
                return scrollRemain < scrollerHeight
        }
    }
    
}
