//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by iamchiwon on 2019/12/14.
//  Copyright © 2019 makecube. All rights reserved.
//

import XCTest
import CWUtilsTest

class ExampleTests: XCTestCase {
    func testSync() {
        // given
        var a = 0
        // when
        a += 1
        // then
        XCTAssertEqual(a, 1)
    }

    func testAsync() {
        // given
        var a = 0

        // when
        await("after 1 second") { done in
            DispatchQueue.main.async {
                sleep(1)
                a = 1

                // then
                XCTAssertEqual(a, 1)
                done()
            }
        }

        // after
        XCTAssertEqual(a, 1)
    }
}
