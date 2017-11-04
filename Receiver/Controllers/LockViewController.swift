//
//  LockViewController.swift
//  Receiver
//
//  Created by Sergei Guselnikov on 31/10/2017.
//  Copyright © 2017 Sergei Guselnikov. All rights reserved.
//

import UIKit

class LockViewController: UIViewController {
    @IBOutlet weak var arcView: ArcView!
    @IBOutlet weak var holeView: UIView!
    @IBOutlet weak var lockView: UIView!
    @IBOutlet weak var triggerView: UIView!
    @IBOutlet weak var triggerViewX: NSLayoutConstraint!
    let viewModel = ViewModel()

    // MARK: View Controller

    override func loadView() {
        super.loadView()

        let lockLayer = lockView.layer
        lockLayer.borderColor = .lockBorderColor
        lockLayer.borderWidth = Constants.lockBorderWidth
        lockLayer.cornerRadius = 10.0

        let holeLayer = holeView.layer
        holeLayer.borderColor = .lockBorderColor
        holeLayer.borderWidth = Constants.lockBorderWidth
        holeLayer.cornerRadius = 6.5

        let triggerLayer = triggerView.layer
        triggerLayer.borderColor = .lockBorderColor
        triggerLayer.borderWidth = Constants.lockBorderWidth
        triggerLayer.cornerRadius = 8.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.updateLockStatus = { [weak self] in
            guard let weakSelf = self else {
                print("ERROR: Lock View Controller is already deallocated.")

                return
            }

            if weakSelf.viewModel.isLockUnlocked {
                weakSelf.anim()
            } else {
                UIView.animate(
                    withDuration: 1.0,
                    delay: 1.0,
                    usingSpringWithDamping: 0.5,
                    initialSpringVelocity: 0.5,
                    options: [],
                    animations: { [weak self] in
                        self?.arcView.transform = .identity
                        self?.triggerView.backgroundColor = self?.view.backgroundColor
                        self?.triggerViewX.constant = 0.0
                        self?.view.layoutIfNeeded()
                    }, completion: nil)
            }
        }
        viewModel.startTrackingBeacons()
    }

    // MARK: Inner Logic

    private func anim() {
        arcView.transform = .identity
        UIView.animate(
            withDuration: 1.0,
            delay: 1.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.5,
            options: [],
            animations: { [weak self] in
            self?.arcView.transform = CGAffineTransform(rotationAngle: 0.25 * .pi)
            self?.triggerView.backgroundColor = .white
            self?.triggerViewX.constant = 10.0
            self?.view.layoutIfNeeded()
        }, completion: nil)
    }

}
