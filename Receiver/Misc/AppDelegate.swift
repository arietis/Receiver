//
//  AppDelegate.swift
//  Receiver
//
//  Created by Sergei Guselnikov on 31/10/2017.
//  Copyright © 2017 Sergei Guselnikov. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    // MARK: Application Delegate

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()

        let rootViewController = TabBarController.instance()
        rootViewController.viewControllers = [
            LockViewController.instance(),
            UINavigationController(rootViewController: ProfileViewController.instance())
        ]
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()

        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        window?.rootViewController?.present(SplashViewController(), animated: false, completion: nil)
    }

}
