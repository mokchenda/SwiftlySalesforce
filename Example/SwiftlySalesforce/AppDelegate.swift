//
//  AppDelegate.swift
//  Example for SwiftlySalesforce
//
//  Created by Michael Epstein on 10/03/2016.
//  Copyright (c) 2016 Michael Epstein. All rights reserved.
//

import UIKit
import SwiftlySalesforce
import UserNotifications

var salesforce: Salesforce!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, LoginDelegate {

    let consumerKey = "3MVG9lcxCTdG2VbstSorFQ6XvBeMcGu67TZ3pVPK8dSm31d4REo6bLbV.RscvtjqVCArg1FxAx2BFq0fQ8p2J"
    //Note that your redirect URL should use a custom scheme, not http or https, e.g. myapp://go.
    let callbackURL = URL(string: "myapp://go")!
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		salesforce = configureSalesforce(consumerKey: consumerKey, callbackURL: callbackURL, loginHost: "devv18-cmp-adecco.cs88.force.com")
		return true
	}
	
	func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
		handleCallbackURL(url, for: salesforce.connectedApp)
		return true
	}
}
