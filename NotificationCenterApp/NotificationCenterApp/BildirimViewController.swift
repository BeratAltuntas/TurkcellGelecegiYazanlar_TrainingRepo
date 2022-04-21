//
//  BildirimViewController.swift
//  NotificationCenterApp
//
//  Created by BERAT ALTUNTAŞ on 21.04.2022.
//

import UIKit

class BildirimViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func sendNotification_TUI(_ sender: Any) {
        let value = ["color" : UIColor.Colors.green]
        
        NotificationCenter.default.post(name: .changeBackgroundColor, object: nil, userInfo: value) // burada POST ile name de belirtilen notification'u tetikliyoruz ve notification yanında userInfo içinde value dictionarysini gönderiyoruz
    }

}
