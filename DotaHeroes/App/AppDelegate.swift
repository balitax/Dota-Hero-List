//
//  AppDelegate.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = UIColor.defaultTheme
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = HeroListsRouter.assembleModule()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        // Remove Sort Default
        SortingEntity.shared.removeAllEntity()
        
        return true
    }

}

