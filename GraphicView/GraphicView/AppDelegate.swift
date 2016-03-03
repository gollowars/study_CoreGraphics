//
//  AppDelegate.swift
//  GraphicView
//
//  Created by Yoshizumi Ashikawa on 2016/03/03.
//  Copyright © 2016年 Yoshizumi Ashikawa. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		window = UIWindow()
    window?.makeKeyAndVisible()

    window?.rootViewController = ViewController()
    return true
  }

}

