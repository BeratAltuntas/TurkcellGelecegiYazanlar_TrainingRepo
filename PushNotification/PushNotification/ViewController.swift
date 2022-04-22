//
//  ViewController.swift
//  PushNotification
//
//  Created by BERAT ALTUNTAŞ on 22.04.2022.
//

import UIKit

class ViewController: UIViewController {

    let notificationIdentifier = "notificationButton"
    var titleNotification:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }

    @IBAction func pushNotification_TUI(_ sender: Any) {
        let notificationContent = UNMutableNotificationContent() // Notification oluşturmak için içeriğin nelerden oluştuğunu belirtiyor
        notificationContent.title = "bildirim title"// başlık
        notificationContent.subtitle = "bildirim subtitle"//altbaşlık
        notificationContent.body = "bildirim body"//metin
        
        let whenIsTriggering = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) // bildirimin ne kadar zamanda bir veya ne zaman gönderileceğini ayarlıyor.
        
        let notification = UNNotificationRequest(identifier: notificationIdentifier, content: notificationContent, trigger: whenIsTriggering)// yukarıda belirttiğimiz içerikte ve belirtilen sürede bir notification isteği oluşturuyor
        
        UNUserNotificationCenter.current().add(notification)// bu method yukarıda oluşturduğumuz isteği bildirim gönderebilmesi için kayıt ediyor, ekliyor UNUserNotificationCenter'a
    }
    
}

