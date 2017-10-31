//
//  UIViewController+Receiver.swift
//  Receiver
//
//  Created by Sergei Guselnikov on 31/10/2017.
//  Copyright © 2017 Sergei Guselnikov. All rights reserved.
//

import UIKit

extension UIViewController {

    class func instance() -> Self {
        return UIStoryboard(name: String(describing: self), bundle: nil).initialViewController()
    }

}
