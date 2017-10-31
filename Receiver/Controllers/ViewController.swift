//
//  ViewController.swift
//  Receiver
//
//  Created by Sergei Guselnikov on 31/10/2017.
//  Copyright © 2017 Sergei Guselnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let viewModel = ViewModel()

    // MARK: View Controller

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.startTrackingBeacons()
    }

}
