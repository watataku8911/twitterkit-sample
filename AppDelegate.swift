//
//  AppDelegate.swift
//  twitterapi
//
//  Created by watataku on 2018/02/27.
//  Copyright © 2018年 綿野拓也. All rights reserved.
//

import UIKit
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        TWTRTwitter.sharedInstance().start(withConsumerKey: "cKGBFAGxlI1KGMskuI4iHtRA2", consumerSecret: "4ixG7lCP6XsuUtb1LrZmCjuhsxoN9edWLql6AI59ygaMj1lvL4")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //Viewcontrollerを指定
        var initialViewController = storyboard.instantiateViewController(withIdentifier: "NavigationLogin")
        
        // UserDefaultsを使用できるようにする
        let defaults = UserDefaults.standard
        
        
        if defaults.string(forKey: "userID") != nil {
            initialViewController = storyboard.instantiateViewController(withIdentifier: "tabbar")
        }
        
        //rootViewControllerに入れる
        self.window?.rootViewController = initialViewController
        
      
        
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if TWTRTwitter.sharedInstance().application(app, open: url, options: options) {
            return true
        }
        return false
    }
    
   


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

