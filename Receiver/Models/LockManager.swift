//
//  LockManager.swift
//  Receiver
//
//  Created by Sergei Guselnikov on 31/10/2017.
//  Copyright © 2017 Sergei Guselnikov. All rights reserved.
//

import CoreLocation
import Dispatch

class LockManager: NSObject {
    var beaconInfo: CLBeaconRegion? {
        guard let uuid = UUID(uuidString: Constants.beaconUUID) else {
            print("Could not start monitoring of CLBeaconRegion because of missing / invalid UUID.")

            return nil
        }

        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 0, minor: 0, identifier: Constants.beaconName)
        beaconRegion.notifyOnEntry = true
        beaconRegion.notifyOnExit = true

        return beaconRegion
    }
    let locationManager = CLLocationManager()
    private(set) var lockBeacon: CLBeacon?
    private(set) var isUnlocked = false {
        didSet {
            guard isUnlocked != oldValue else { return }

            DispatchQueue.main.async { [weak self] in
                self?.updateLockStatus?()
            }
        }
    }
    private(set) var timer: DispatchSourceTimer?
    var updateLockStatus: (() -> Void)?

    // MARK: Public Interface

    override init() {
        super.init()

        self.setup()
    }

    func startRanging() {
        guard let info = beaconInfo else {
            print("Could not start/stop ranging of CLBeaconRegion because of missing beacon info.")

            return
        }

        locationManager.startMonitoring(for: info)
        locationManager.startUpdatingLocation()
        scheduleNetworkRequest()
    }

    func stopRanging() {
        timer?.cancel()
        timer = nil
        lockBeacon = nil
    }

    // MARK: Inner Logic

    private func accessLock() {
        guard let beacon = lockBeacon, beacon.proximity == .immediate else { return }

        guard let url = URL(string: Constants.accessURL) else {
            print("Unable to access lock: URL is undefined.")

            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.allHTTPHeaderFields = [ "authorization": Constants.authToken ]
        request.httpMethod = "POST"

        let urlRequest = request as URLRequest

        let dataTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { [weak self] (data, _, error) in
            if let err = error {
                print(err.localizedDescription)

                return
            }

            self?.processResponseData(data)
        })

        dataTask.resume()
    }

    private func processResponseData(_ responseData: Data?) {
        guard let data = responseData else {
            isUnlocked = false

            return
        }

        var json: Any? = nil

        do {
            json = try JSONSerialization.jsonObject(with: data, options: [])
        } catch let error {
            print(error.localizedDescription)
        }

        guard let accessData = json as? [String: String] else {
            isUnlocked = false

            return
        }

        isUnlocked = accessData["message"] == Constants.isUnlockedValue
    }

    private func scheduleNetworkRequest() {
        timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global(qos: .`default`))
        timer?.schedule(deadline: .now(), repeating: .seconds(4))
        timer?.setEventHandler(handler: { [weak self] in
            self?.isUnlocked = false
            self?.accessLock()
        })
        timer?.resume()
    }

    private func setup() {
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.delegate = self
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.requestAlwaysAuthorization()
    }

}

extension LockManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        guard let info = beaconInfo else {
            print("Could not start/stop ranging of CLBeaconRegion because of missing beacon info.")

            return
        }

        switch state {
        case .inside:
            locationManager.startRangingBeacons(in: info)
        case .outside, .unknown:
            locationManager.stopRangingBeacons(in: info)
        }
    }

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        locationManager.requestState(for: region)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        guard let beacon = beacons.first(where: { $0.proximityUUID.uuidString == Constants.beaconUUID }) else {
            lockBeacon = nil

            return
        }

        lockBeacon = beacon
    }

    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        manager.requestState(for: region)
    }

    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print(error.localizedDescription)
    }

    func locationManager(
        _ manager: CLLocationManager,
        rangingBeaconsDidFailFor region: CLBeaconRegion,
        withError error: Error) {
        print(error)
        lockBeacon = nil
    }

}
