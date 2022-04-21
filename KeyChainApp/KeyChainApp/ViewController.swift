//
//  ViewController.swift
//  KeyChainApp
//
//  Created by BERAT ALTUNTAŞ on 21.04.2022.
//

import UIKit
import Security

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        write()
        read()
    }
    
    func write(){
        let query = [
            kSecValueData : "Berat Altuntaş".data(using: .utf8)!, //değer
            kSecAttrAccount : "userName",//değerin değişken adı çağırırken kullanmak için
            kSecClass : kSecClassGenericPassword // şifreleme tipi
        ] as CFDictionary
        
        SecItemAdd(query, nil)
    }



    func read(){
        let query = [
            kSecAttrAccount : "userName",
            kSecClass : kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary
        
        var ref : AnyObject? = nil
        
        let durum = SecItemCopyMatching(query, &ref) //şifrelenen değere ulaşma methodu, & işareti nil girip içeride doldurulacağı anlamına geliyor. Şifreli nesneyi ref in içerisine aktarıyor.
        if durum == 0{
            let value = String(data: ref as! Data, encoding: .utf8)
            print(value!)
        }
    }
}

