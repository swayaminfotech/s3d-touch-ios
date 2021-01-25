//
//  AppDelegate.swift
//  S3DTouch
//
//  Created by Swayam Infotech on 28/09/20.
//  Copyright © 2020 Swayam Infotech. All rights reserved.
//

import UIKit
import Messages

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var navigationControl = UINavigationController()

    // to saved shortcut item used as a result of an app launch, used later when app is activated.
    var threeDShortcutItem: UIApplicationShortcutItem?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        configureShortcutItems()

        // after shortcut launched to display its information and take the appropriate action.
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            threeDShortcutItem = shortcutItem
        }
        
        //to set initial view controller
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "Home")
        vc.title = "name".localized
        navigationControl = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationControl
        window?.makeKeyAndVisible()

        return true
    }

    func configureShortcutItems() {
        
        let icon = UIApplicationShortcutIcon.init(templateImageName: "shortcut_icon")
                    
        // to configure open link shortcut.
        let openLink = UIApplicationShortcutItem.init(type: "open_link".localized, localizedTitle: "open_link".localized, localizedSubtitle: "", icon: icon, userInfo: nil)
        
        // to configure message compose shortcut.
        let messageCompose = UIApplicationShortcutItem.init(type: "message_compose".localized, localizedTitle: "message_compose".localized, localizedSubtitle: "", icon: icon, userInfo: nil)
        
        // to configure call shortcut.
        let callUs = UIApplicationShortcutItem.init(type: "call_us".localized, localizedTitle: "call_us".localized, localizedSubtitle: "", icon: icon, userInfo: nil)
        
        // to configure second screen shortcut.
        let secondScreen = UIApplicationShortcutItem.init(type: "welcome".localized, localizedTitle: "welcome".localized, localizedSubtitle: "", icon: icon, userInfo: nil)

        
        UIApplication.shared.shortcutItems = [openLink, messageCompose, callUs, secondScreen]
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {

        guard let shortcutItem = threeDShortcutItem else { return }

        // if there is any shortcutItem,that will be handled upon the app becomes active
        _ = handleShortcutItem(item: shortcutItem)

        // we make it nil after perfom/handle method call for that shortcutItem action
        threeDShortcutItem = nil
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        completionHandler(handleShortcutItem(item: shortcutItem))
    }
    
    func handleShortcutItem(item: UIApplicationShortcutItem) -> Bool {

        var handle = false
        
        if item.type == "open_link".localized {
            
            // to handle open link.
            handleOpenUrl()
            handle = true
            
        }else if item.type == "message_compose".localized {
            
            // to handle message compose.
            handleSendMessage()
            handle = true
            
        }else if item.type == "call_us".localized {
            
            // to handle call us.
            handleCall()
            handle = true
            
        }else if item.type == "welcome".localized {
            
            // to handle open second screen.
            handleWelcome()
            handle = true
        }
        
        return handle
    }
    
    func handleOpenUrl() {
        if let url = URL(string: "http://www.google.com") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                if UIApplication.shared.canOpenURL(url) {
                   UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    func handleSendMessage() {
        if let url = URL(string: "sms:") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                if UIApplication.shared.canOpenURL(url) {
                   UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    func handleCall() {
        if let url = URL(string: "tel://0000000") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                if UIApplication.shared.canOpenURL(url) {
                   UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    func handleWelcome() {
        self.navigationControl = UINavigationController(rootViewController: Welcome())
        window?.rootViewController = navigationControl
        window?.makeKeyAndVisible()
    }
    
}
