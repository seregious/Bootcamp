//
//  LocalNotification_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 19.02.2022.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuth() {
        let options : UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("error \(error)")
            } else {
                print("success")
            }
        }
    }
    

    
    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification"
        content.subtitle = "This is sooo easy"
        content.sound = .default
        content.badge = 1
        
        //TIME
//        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //CALENDAR
//        var dateComponents = DateComponents()
//        dateComponents.hour = 1
//        dateComponents.minute = 40
//        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //LOCATION
        let coordinates = CLLocationCoordinate2D(
            latitude: 40,
            longitude: 50)
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        let triger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: triger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotification_: View {
    var body: some View {
        VStack(spacing: 40) {
            
            Button("Request") {
                NotificationManager.instance.requestAuth()
            }
            
            Button("Schedule notification") {
                NotificationManager.instance.scheduleNotification()
            }
            
            Button("Cancel notification") {
                NotificationManager.instance.cancelNotification()
            }
            
    }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotification__Previews: PreviewProvider {
    static var previews: some View {
        LocalNotification_()
    }
}
