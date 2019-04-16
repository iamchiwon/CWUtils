//
//  UIControl+Rx.swift
//  CWUtils
//
//  Created by iamchiwon on 09/02/2019.
//

import RxCocoa
import RxSwift
import UIKit

public struct TargetedControlEvent<T> {
    public var event: UIControl.Event
    public var sender: T
}

public extension Reactive where Base: UIControl {
    func controlEvent(event: UIControl.Event) -> Observable<TargetedControlEvent<Base>> {
        let targetedControlEvent = TargetedControlEvent(event: event, sender: base)
        return base.rx.controlEvent(event).map({ _ in targetedControlEvent })
    }

    func controlEvent(events: [UIControl.Event]) -> Observable<TargetedControlEvent<Base>> {
        return Observable.merge(events.map({ controlEvent(event: $0) }))
    }

    var allTouchEvents: Observable<TargetedControlEvent<Base>> {
        let touchEvents: [UIControl.Event] = [
            .touchDownRepeat,
            .touchDragInside,
            .touchDragOutside,
            .touchDragEnter,
            .touchDragExit,
            .touchUpInside,
            .touchUpOutside,
            .touchCancel,
        ]
        return controlEvent(events: touchEvents)
    }

    var allEditingEvents: Observable<TargetedControlEvent<Base>> {
        let editingEvents: [UIControl.Event] = [
            .editingDidBegin,
            .editingChanged,
            .editingDidEnd,
            .editingDidEndOnExit,
        ]
        return controlEvent(events: editingEvents)
    }

    var allEvents: Observable<TargetedControlEvent<Base>> {
        let events: [UIControl.Event] = [
            .valueChanged,
            .applicationReserved,
            .systemReserved,
        ]

        var eventObservables = events.map({ controlEvent(event: $0) })
        eventObservables.append(contentsOf: [allTouchEvents, allEditingEvents])

        return Observable.merge(eventObservables)
    }
}
