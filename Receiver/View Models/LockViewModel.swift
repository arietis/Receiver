//
//  LockViewModel.swift
//  Receiver
//
//  Created by Sergei Guselnikov on 31/10/2017.
//  Copyright © 2017 Sergei Guselnikov. All rights reserved.
//

import Foundation

class LockViewModel {
    var isLockUnlocked: Bool {
        return lock.isUnlocked
    }
    private let lock = LockManager()
    var updateLockStatus: (() -> Void)? {
        didSet {
            lock.updateLockStatus = updateLockStatus
        }
    }

    // MARK: Public Interface

    func startTrackingBeacons() {
        lock.startTrackingBeacons()
    }

    func stopTrackingBeacons() {
        lock.stopTrackingBeacons()
    }

}
