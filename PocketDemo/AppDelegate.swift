//
//  AppDelegate.swift
//  PocketDemo
//
//  Created by mac on 11/27/17.
//  Copyright © 2017 Pabel Nunez Landestoy. All rights reserved.
//

import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("AppDelegate - didFinishLaunchingWithOptions()")
        // Override point for customization after application launch.
        // Inital transaction fetch
        self.fetchTransactions()
        
        return true
    }
    
    public func fetchTransactions() {
        print("AppDelegate - fetchTransactions()")

        let getTransactionsOperation = TransactionGetOperation.init()
        
        _ = getTransactionsOperation.GetRequest(url: "https://pkt-node-demo.herokuapp.com", path: "/transactions") { (transactions) in
            print("AppDelegate - fetchTransactions() - Transactions GetRequest succeed")
            if  transactions.count > 0 {
                UserDefaults.standard.set(transactions, forKey: "transactions")
                UserDefaults.standard.set(0, forKey: "index")
                print("AppDelegate - fetchTransactions() - Transactions saved to UserDefaults")
                print("AppDelegate - fetchTransactions() - Transactions Index = 0")
                
                DispatchQueue.main.async {
                    if let activeViewController  = self.window?.rootViewController as? MainViewController {
                        print("AppDelegate - fetchTransactions() - Executing RequestButtonAction to use new fetched data")
                        activeViewController.RequestButtonAction(self)
                    }
                }
                
            }else{
                print("AppDelegate - didFinishLaunchingWithOptions - No transactions loaded")
            }
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
    }


}

