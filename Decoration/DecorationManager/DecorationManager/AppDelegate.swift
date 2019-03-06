//
//  AppDelegate.swift
//  DecorationManager
//
//  Created by ysj on 2017/11/16.
//  Copyright © 2017年 ysj. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let homePageVC = HomePageViewController()
        let homeNav = YSJNavigationController(rootViewController: homePageVC)
        let homeNavTabBarItem = UITabBarItem(title: "我是第1页", image: nil, selectedImage: nil)
        homeNavTabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: ColorFromHex("41444e"), NSAttributedStringKey.font: FontR(UIScale(12))], for: .normal)
        homeNav.tabBarItem = homeNavTabBarItem
        
        let shoppingVC = ShoppingStoreViewController()
        let shoppingNav = YSJNavigationController(rootViewController: shoppingVC)
        let shoppingNavTabBarItem = UITabBarItem(title: "我是第2页", image: nil, selectedImage: nil)
        shoppingNavTabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: ColorFromHex("41444e"), NSAttributedStringKey.font: FontR(UIScale(12))], for: .normal)
        shoppingNav.tabBarItem = shoppingNavTabBarItem
        
        let personVC = PersonCenterViewController()
        let personNav = YSJNavigationController(rootViewController: personVC)
        let personNavTabBarItem = UITabBarItem(title: "我是第3页", image: nil, selectedImage: nil)
        personNavTabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: ColorFromHex("41444e"), NSAttributedStringKey.font: FontR(UIScale(12))], for: .normal)
        personNav.tabBarItem = personNavTabBarItem
        
        let tabBar = YSJTabBarController()
        tabBar.viewControllers = [homeNav, shoppingNav, personNav]
        
        window?.rootViewController = tabBar
        
        /// 是否登录
        if UserManager.shared.isLogin {
            //已经登录 刷新token
        } else {
            self.showLoginView(successLoginChangedRootBar: tabBar)
        }
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func showLoginView(successLoginChangedRootBar: UITabBarController) {
        let loginVC = LoginViewController()
        let navigationCon = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navigationCon
        loginVC.successLogin = { [weak self] in
            guard let weakself = self else {
                return
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7, execute: {
                weakself.window?.rootViewController = successLoginChangedRootBar
            })
        }
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
        // Saves changes in the application's managed object context before the application terminates.
        if #available(iOS 10.0, *) {
            self.saveContext()
        } else {
            // Fallback on earlier versions
        }
    }

    // MARK: - Core Data stack

    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "DecorationManager")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    @available(iOS 10.0, *)
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

