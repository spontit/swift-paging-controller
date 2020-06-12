//
//  AppDelegate.swift
//  SwiftPagingController
//
//  Created by Zhang Qiuhao on 6/12/20.
//  Copyright © 2020 Zhang Qiuhao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let VC1 = UIViewController()
        VC1.view.backgroundColor = .blue
        VC1.title = "VC1"
        let VC2 = UIViewController()
        VC2.view.backgroundColor = .red
        VC2.title = "VC2"
        let VC3 = UIViewController()
        VC3.view.backgroundColor = .green
        VC3.title = "VC3"
        let VCs = [VC1, VC2, VC3]
        self.window?.rootViewController = MenuBarViewController(titles: [VC1.title!, VC2.title!, VC3.title!])
        self.window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle


}

