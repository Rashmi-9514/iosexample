//
//  NotificationService.swift
//  NotificationService
//
//  Created by Rashmi Yadav on 25/11/22.
//

import UserNotifications
import CTNotificationService
import CleverTapSDK

class NotificationService: CTNotificationServiceExtension {
    
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
    
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        CleverTap.setDebugLevel(CleverTapLogLevel.debug.rawValue)
        // While running the Application add CleverTap Account ID and Account token in your .plist file
//        CleverTap.sharedInstance()?.recordEvent("testEventFromAppex")
//        let profile: Dictionary<String, AnyObject> = [
//            "Identity": 61026032 as AnyObject,
//            "Email": "jack@gmail.com" as AnyObject]
//        CleverTap.sharedInstance()?.profilePush(profile)
        // call to record the Notification viewed
        
        let userDefaults = UserDefaults(suiteName: "group.sampleios")
        let testUserId = userDefaults?.object(forKey: "identity")
    
        CleverTap.sharedInstance()?.onUserLogin(testUserId as! [AnyHashable : Any])
        CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: request.content.userInfo)
        super.didReceive(request, withContentHandler: contentHandler)
    }
}
