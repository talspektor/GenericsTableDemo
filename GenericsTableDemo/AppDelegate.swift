//
//  AppDelegate.swift
//  GenericsTableDemo
//
//  Created by user140592 on 2/20/19.
//  Copyright © 2019 talspektor. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.makeKeyAndVisible()
        
        window?.rootViewController = SomeListController()
        
        return true
    }
    // Model / ViewModel
    struct Person {
        let firstName, lastName: String
    }
    
    //View
    class PersonCell: GenericCell<Person> {
        override var item: Person! {
            didSet {
                textLabel?.text = "\(item.firstName)\(item.lastName)"
            }
        }
    }
    
    //Controller
    class PeopleController: GenericTableViewController<PersonCell, Person> {
        override func viewDidLoad() {
            super.viewDidLoad()
            items = [Person(firstName: "Bill", lastName: "Clinton"),
                     Person(firstName: "Barack", lastName: "Obama"),
                     Person(firstName: "Donald", lastName: "Trump")]
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

