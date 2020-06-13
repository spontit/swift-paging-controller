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
        
        let VC1 = UIViewController()
        VC1.view.backgroundColor = .blue
        VC1.title = "View Controller 1"
        let VC2 = UIViewController()
        VC2.view.backgroundColor = .red
        VC2.title = "VC2"
        let VC3 = UIViewController()
        VC3.view.backgroundColor = .green
        VC3.title = "VC3829479"
        let VC4 = UIViewController()
        VC4.view.backgroundColor = .orange
        VC4.title = "VC4444444444444444444"
        let VCs = [VC1, VC2, VC3, VC4]
        
        let pageVC = PagingViewController(controllers: VCs)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = pageVC
        
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

