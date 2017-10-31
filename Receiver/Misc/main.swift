//
//  main.swift
//  Receiver
//
//  Created by Sergei Guselnikov on 31/10/2017.
//  Copyright © 2017 Sergei Guselnikov. All rights reserved.
//

import UIKit

let appDelegateClass: AnyClass? = NSClassFromString("ReceiverTests.TestingAppDelegate") ?? AppDelegate.self

let pointer = UnsafeMutableRawPointer(CommandLine.unsafeArgv)

let args = pointer.bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))
UIApplicationMain(CommandLine.argc, args, nil, NSStringFromClass(appDelegateClass!))
