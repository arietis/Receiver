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
        lockLayer.borderColor = UIColor.white.cgColor
        lockLayer.borderWidth = 2.0
        lockLayer.cornerRadius = 10.0

        let holeLayer = holeView.layer
        holeLayer.borderColor = UIColor.white.cgColor
        holeLayer.borderWidth = 2.0
        holeLayer.cornerRadius = 6.5

        let triggerLayer = triggerView.layer
        triggerLayer.borderColor = UIColor.white.cgColor
        triggerLayer.borderWidth = 2.0
        triggerLayer.cornerRadius = 8.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.startTrackingBeacons()
        anim()
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
        }, completion: { _ in
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
            }, completion: { [weak self] _ in
                self?.anim()
            })
        })
    }

}
