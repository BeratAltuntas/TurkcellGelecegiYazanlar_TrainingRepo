//
//  ViewController.swift
//  NotificationCenterApp
//
//  Created by BERAT ALTUNTAŞ on 21.04.2022.
//

import UIKit


class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(readNotification), name: .changeBackgroundColor, object: nil) // name adında bir notification dinleyicisi,gözlemcisi oluşturuyoruz eğer herhangi bir yerde bu isimde bir notification tetiklenirse buradaki selector da belirtilen method çalışacaktır.
    }
    
    @objc func readNotification(_ notification: Notification){
        guard let color = notification.userInfo?["color"] else {return}
        view.backgroundColor = color as! UIColor
        
        
        
    }

}

extension Notification.Name{// burada bir Notification.Name extension'u  yazarak farklı dosyalarda isim karmaşası yanlış isim yazmaktan dolayı çıkacak karmaşanın önüne geçiliyor.
    static let changeBackgroundColor = Notification.Name("changeBackgroundColor") // ve ne zaman notificationSend çağırılsa notification1 ismindeki değer atanıyor addObserver veya post'a
}

extension UIColor{
    struct Colors{// colors isminde bir struct oluşturuyorum kendi istediğim özellikte renkler elde edebilmek için
        static var red : UIColor  { return UIColor(red: 1, green: 0, blue: 0, alpha: 1) }
        static var blue : UIColor  { return UIColor(red: 0, green: 0, blue: 1, alpha: 1) }
        static var green : UIColor  { return UIColor(red: 0, green: 1, blue: 0, alpha: 1) }
        static var black : UIColor  { return UIColor(red: 0, green: 0, blue: 0, alpha: 1) }
        static var white : UIColor  { return UIColor(red: 1, green: 1, blue: 1, alpha: 1) }
    }
}


