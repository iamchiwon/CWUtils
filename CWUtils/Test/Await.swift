//
//  Await.swift
//  CWUtilsTest
//
//  Created by iamchiwon on 14/12/2019.
//

import XCTest

extension XCTestCase {
    public func await(_ description: String = "", timeout: TimeInterval = 3, testing: @escaping (() -> Void) -> Void) {
        let exp = expectation(description: description)
        let done: () -> Void = { exp.fulfill() }

        let startTime = Date().timeIntervalSince1970 * 1000
        testing(done)
        let diff = Date().timeIntervalSince1970 * 1000 - startTime

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumSignificantDigits = 2

        let diffStr = numberFormatter.string(from: NSNumber(value: diff)) ?? "N/A"
        print("[AWAIT] \(description) : \(diffStr) (ms)")

        waitForExpectations(timeout: timeout + 0.1)
    }
}
