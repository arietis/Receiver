//
//  SplashViewController.swift
//  Receiver
//
//  Created by Sergei Guselnikov on 03/11/2017.
//  Copyright © 2017 Sergei Guselnikov. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    // MARK: View Controller

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        perform(#selector(SplashViewController.hide), with: nil, afterDelay: Constants.hideSplashScreenDelay)
    }

    // MARK: Inner Logic

    @objc private func hide() {
        dismiss(animated: false, completion: nil)
    }

}
