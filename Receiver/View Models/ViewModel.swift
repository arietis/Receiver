//
//  ViewModel.swift
//  Receiver
//
//  Created by Sergei Guselnikov on 31/10/2017.
//  Copyright © 2017 Sergei Guselnikov. All rights reserved.
//

import Foundation

class ViewModel {
    let lock = LockManager()

    // MARK: Public Interface

    func startTrackingBeacons() {
        lock.startRanging()
    }

    func stopTrackingBeacons() {
        lock.stopRanging()
    }

}
