//
//  UIControl+Rx.swift
//  CWUtils
//
//  Created by iamchiwon on 09/02/2019.
//

import UIKit
import RxSwift
import RxCocoa

public struct TargetedControlEvent<T> {
    public var event: UIControl.Event
    public var sender: T
}

extension Reactive where Base: UIControl {
    
    public func controlEvent(event: UIControl.Event) -> Observable<TargetedControlEvent<Base>> {
        let targetedControlEvent = TargetedControlEvent(event: event, sender: base)
        return base.rx.controlEvent(event).map({ _ in targetedControlEvent })
    }
    
    public func controlEvent(events: [UIControl.Event]) -> Observable<TargetedControlEvent<Base>> {
        return Observable.merge(events.map({ controlEvent(event: $0) }))
    }
    
    public var allTouchEvents: Observable<TargetedControlEvent<Base>> {
        let touchEvents: [UIControl.Event] = [
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
        let editingEvents: [UIControl.Event] = [
            .editingDidBegin,
            .editingChanged,
            .editingDidEnd,
            .editingDidEndOnExit
        ]
        return controlEvent(events: editingEvents)
    }
    
    public var allEvents: Observable<TargetedControlEvent<Base>> {
        let events: [UIControl.Event] = [
            .valueChanged,
            .applicationReserved,
            .systemReserved
        ]
        
        var eventObservables = events.map({ controlEvent(event: $0) })
        eventObservables.append(contentsOf: [allTouchEvents, allEditingEvents])
        
        return Observable.merge(eventObservables)
    }
    
}
