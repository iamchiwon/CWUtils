//
//  ScrollView+More.swift
//  CWUtils
//
//  Created by iamchiwon on 2018. 2. 14..
//

import UIKit
import RxSwift
import RxCocoa

public extension UIScrollView {
    
    func needsMore() -> Observable<UIScrollView> {
        return self.rx.didScroll.map { _ in self }
            .filter {
                let offsetY = $0.contentOffset.y
                let scrollerHeight = $0.bounds.size.height
                let scrollRemain = $0.contentSize.height - offsetY - scrollerHeight
                return scrollRemain < scrollerHeight
        }
    }
    
    func calcScrollViewEndingPosition() -> CGPoint {
        let W = self.contentSize.width
        let w = self.bounds.width
        let r = self.contentInset.right
        
        let H = self.contentSize.height
        let h = self.bounds.height
        let b = self.contentInset.bottom
        
        return CGPoint(x: W - w + r, y: H - h + b)
    }
}
