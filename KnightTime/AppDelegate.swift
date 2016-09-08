//
//  AppDelegate.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 1/27/16.
//  Copyright © 2016 N Squared Productions. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{

    var window: UIWindow?
    
    var firstPeriod = "1st Period"
    var secondPeriod = "2nd Period"
    var thirdPeriod = "3rd Period"
    var fourthPeriod = "4th Period"
    var fifthPeriodA = "5A"
    var fifthPeriodB = "5B"
    var sixthPeriod = "6th Period"
    var seventhPeriod = "7th Period"
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
//        let notificationSettings = UIUserNotificationSettings(forTypes:[UIUserNotificationType.Alert,UIUserNotificationType.Sound], categories: nil)
//        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
        
        //Display Launch Screen for 2 seconds
        //NSThread .sleepForTimeInterval(NSTimeInterval(1.5))
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        NSUserDefaults.standardUserDefaults().setObject(firstPeriod, forKey: "firstPeriod")
        NSUserDefaults.standardUserDefaults().setObject(secondPeriod, forKey: "secondPeriod")
        NSUserDefaults.standardUserDefaults().setObject(thirdPeriod, forKey: "thirdPeriod")
        NSUserDefaults.standardUserDefaults().setObject(fourthPeriod, forKey: "fourthPeriod")
        NSUserDefaults.standardUserDefaults().setObject(fifthPeriodA, forKey: "fifthPeriodA")
        NSUserDefaults.standardUserDefaults().setObject(fifthPeriodB, forKey: "fifthPeriodB")
        NSUserDefaults.standardUserDefaults().setObject(sixthPeriod, forKey: "sixthPeriod")
        NSUserDefaults.standardUserDefaults().setObject(seventhPeriod, forKey: "seventhPeriod")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        firstPeriod = NSUserDefaults.standardUserDefaults().stringForKey("firstPeriod") ?? ""
        secondPeriod = NSUserDefaults.standardUserDefaults().stringForKey("secondPeriod") ?? ""
        thirdPeriod = NSUserDefaults.standardUserDefaults().stringForKey("thirdPeriod") ?? ""
        fourthPeriod = NSUserDefaults.standardUserDefaults().stringForKey("fourthPeriod") ?? ""
        fifthPeriodA = NSUserDefaults.standardUserDefaults().stringForKey("fifthPeriodA") ?? ""
        fifthPeriodB = NSUserDefaults.standardUserDefaults().stringForKey("fifthPeriodB") ?? ""
        sixthPeriod = NSUserDefaults.standardUserDefaults().stringForKey("sixthPeriod") ?? ""
        seventhPeriod = NSUserDefaults.standardUserDefaults().stringForKey("seventhPeriod") ?? ""
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

