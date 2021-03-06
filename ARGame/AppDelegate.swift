//
//  AppDelegate.swift
//  ARGame
//
//  Created by Aleksandr on 21/11/2017.
//  Copyright © 2017 Aleksandr. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinatorInterface?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        initializeFrameworks()
        initializeUserInterface()
        
        return true
    }
    
    func initializeUserInterface() {
        
        appCoordinator = AppCoordinator()
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window!.rootViewController = appCoordinator!.navController
        window!.makeKeyAndVisible()

        appCoordinator!.start()
    }
    
    func initializeFrameworks () {
        
        // Google maps
        GMSServices.provideAPIKey("AIzaSyCVAk-_vZfnl5db0bVf5NxqMrCLihLEvyA")
        
        // Firebase
        FirebaseApp.configure()
        let lang = Locale.current.languageCode
        Auth.auth().languageCode = lang
    }
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification notification: [AnyHashable : Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        if Auth.auth().canHandleNotification(notification) {
            completionHandler(.noData)
            return
        }
        
        // This notification is not auth related, developer should handle it.
        //handleNotification(notification)
    }
}
