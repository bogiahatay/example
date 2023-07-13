import UIKit
import UserNotifications
import FirebaseCore
import FirebaseMessaging

extension AppDelegate: UNUserNotificationCenterDelegate, MessagingDelegate {

    func initPush(_ application: UIApplication) {
        log("FCM", "initPush")
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { _, _ in })
        application.registerForRemoteNotifications()
        log("FCM", "subscribe")
        Messaging.messaging().subscribe(toTopic: "all") { error in
            log("FCM", "Subs: all")
        }
        Messaging.messaging().subscribe(toTopic: "ios") { error in
            log("FCM", "Subs: ios")
        }
        #if DEBUG
        Messaging.messaging().subscribe(toTopic: "debug") { error in
            log("FCM", "Subs: debug")
        }
        #endif
        
        Messaging.messaging().isAutoInitEnabled = true
        Messaging.messaging().delegate = self
        Messaging.messaging().token { token, error in
          if let error = error {
            print("Error fetching FCM registration token: \(error)")
          }
        if let token = token {
            print("FCM registration token: \(token)")
          }
        }

    }

    // App Forceground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        log("FCM", "Notification Reciver")
        completionHandler([.banner, .badge, .sound])
    }

    // App Click Notify
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        log("FCM", "Notification Click")
//        Ads.getInstance().pause(5000)

        let userInfo = response.notification.request.content.userInfo

        let push = userInfo["json"] as? String ?? ""
        log("FCM", "data: " +  push)
//        MyApp.getInstance().push = push
//        MyApp.getInstance().onPush()

//        log(push)

        completionHandler()
    }

    func application(application: UIApplication,  didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        log("FCM", "didRegisterForRemoteNotificationsWithDeviceToken" )
        Messaging.messaging().apnsToken = deviceToken
    }

    
    func extractUserInfo(_ userInfo: [AnyHashable: Any]) -> (title: String, body: String) {
        var info = (title: "", body: "")
        guard let aps = userInfo["aps"] as? [String: Any] else { return info }
        guard let alert = aps["alert"] as? [String: Any] else { return info }
        let title = alert["title"] as? String ?? ""
        let body = alert["body"] as? String ?? ""
        info = (title: title, body: body)
        return info
    }
}
