//
//  Constants.swift
//  Receiver
//
//  Created by Sergei Guselnikov on 31/10/2017.
//  Copyright © 2017 Sergei Guselnikov. All rights reserved.
//

import CoreGraphics
import CoreLocation

enum Constants {
    static let accessURL = "https://api.getkisi.com/locks/5872/access"
    static let authToken = "KISI-LINK 75388d1d1ff0dff6b7b04a7d5162cc6c"
    static let beaconMajor = UInt16(0)
    static let beaconMinor = UInt16(0)
    static let beaconName = "Receiver"
    static let beaconUUID = "EC6F3659-A8B9-4434-904C-A76F788DAC43"
    static let hideSplashScreenDelay = 5.0
    static let isUnlockedValue = "Unlocked!"
    static let lockBorderWidth = CGFloat(2.0)
    static let requestTimeout = 10.0
    static let unlockInterval = 4
}
