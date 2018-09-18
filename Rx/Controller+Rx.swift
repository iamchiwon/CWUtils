//
//  Rx+Control.swift
//  ReactiveSample
//
//  Created by iamchiwon on 2018. 8. 1..
//  Copyright © 2018년 iamchiwon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public struct TargetedControlEvent<T> {
    public var event: UIControlEvents
    public var sender: T
}

extension Reactive where Base: UIControl {
    
    public func controlEvent(event: UIControlEvents) -> Observable<TargetedControlEvent<Base>> {
        let targetedControlEvent = TargetedControlEvent(event: event, sender: base)
        return base.rx.controlEvent(event).map({ _ in targetedControlEvent })
    }
    
    public func controlEvent(events: [UIControlEvents]) -> Observable<TargetedControlEvent<Base>> {
        return Observable.merge(events.map({ controlEvent(event: $0) }))
    }
    
    public var allTouchEvents: Observable<TargetedControlEvent<Base>> {
        let touchEvents: [UIControlEvents] = [
            .touchDownRepeat,
            .touchDragInside,
            .touchDragOutside,
            .touchDragEnter,
            .touchDragExit,
            .touchUpInside,
            .touchUpOutside,
            .touchCancel
        ]
        return controlEvent(events: touchEvents)
    }
    
    public var allEditingEvents: Observable<TargetedControlEvent<Base>> {
        let editingEvents: [UIControlEvents] = [
            .editingDidBegin,
            .editingChanged,
            .editingDidEnd,
            .editingDidEndOnExit
        ]
        return controlEvent(events: editingEvents)
    }
    
    public var allEvents: Observable<TargetedControlEvent<Base>> {
        let events: [UIControlEvents] = [
            .valueChanged,
            .applicationReserved,
            .systemReserved
        ]
        
        var eventObservables = events.map({ controlEvent(event: $0) })
        eventObservables.append(contentsOf: [allTouchEvents, allEditingEvents])
        
        return Observable.merge(eventObservables)
    }
    
}
