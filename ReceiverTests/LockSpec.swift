//
//  LockSpec.swift
//  ReceiverTests
//
//  Created by Sergei Guselnikov on 31/10/2017.
//  Copyright © 2017 Sergei Guselnikov. All rights reserved.
//

import Nimble
import Quick
@testable import Receiver

class LockSpec: QuickSpec {

    override func spec() {
        describe("Lock Manager") {
            var lockManager: LockManager!
            beforeEach {
                lockManager = LockManager()
            }
            it("should have expected props setup") {
                expect(lockManager.locationManager).toNot(beNil())
            }
        }
    }

}
