//
//  UIStoryboard+Receiver.swift
//  Receiver
//
//  Created by Sergei Guselnikov on 31/10/2017.
//  Copyright © 2017 Sergei Guselnikov. All rights reserved.
//

import UIKit

extension UIStoryboard {

    func initialViewController<T: UIViewController>() -> T {
        guard let controller = instantiateInitialViewController() as? T else {
            fatalError("Unable to instantiate initial view controller.")
        }

        return controller
    }

}
