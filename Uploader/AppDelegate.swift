//
//  AppDelegate.swift
//  Uploader
//
//  Created by mono on 6/29/14.
//  Copyright (c) 2014 mono. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let parseApplicationId = "yGA6UdvCTMxt3xHSgUJEX5if3O4hCmBS5AHA5Pny"
    let parseClientKey = "oexJG0qMpMfqREQD1CGt4cWJPl0OEXvqnCtfMNCB"


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {

        
//        Parse.setApplicationId(parseApplicationId, clientKey: parseClientKey)
//        PFFacebookUtils.initializeFacebook()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
//        FBAppCall.handleDidBecomeActiveWithSession(PFFacebookUtils.session())
    }

    func applicationWillTerminate(application: UIApplication) {
        MagicalRecord.cleanUp()
    }
    
    func application(application: UIApplication!,
        openURL url: NSURL!,
        sourceApplication: String!,
        annotation: AnyObject!) -> Bool {
        
//            return FBAppCall.handleOpenURL(url, sourceApplication: sourceApplication, withSession: PFFacebookUtils.session())
            return true
    }


}

