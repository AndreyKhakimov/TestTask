//
//  AppDelegate.swift
//  TestTask
//
//  Created by Andrey Khakimov on 31.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController(rootViewController: MainViewController())
        if #available(iOS 13.0, *) {
            navigationController.navigationBar.scrollEdgeAppearance =
            navigationController.navigationBar.standardAppearance
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        window?.makeKeyAndVisible()
        
        return true
    }

}

