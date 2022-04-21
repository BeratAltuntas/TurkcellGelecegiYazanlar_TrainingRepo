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
        dataWrite()
        dataRead()
        
        dataUpdate()
        dataRead()
        
        dataDelete()
        dataRead()
    }
    
    func dataWrite(){
        let query = [
            kSecValueData : "Berat Altuntaş".data(using: .utf8)!, //değer
            kSecAttrAccount : "userName",//değerin değişken adı çağırırken kullanmak için
            kSecClass : kSecClassGenericPassword // şifreleme tipi
        ] as CFDictionary
        
        let status = SecItemAdd(query, nil)
        
        if status == 0{
            print("Data Added successfully. Status Code:",status)
        }else{
            print("Status code:",status)
        }
    }

    func dataRead(){
        let query = [
            kSecAttrAccount : "userName",
            kSecClass : kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary
        
        var ref : AnyObject? = nil
        
        let status = SecItemCopyMatching(query, &ref) //şifrelenen değere ulaşma methodu, & işareti nil girip içeride doldurulacağı anlamına geliyor. Şifreli nesneyi ref in içerisine aktarıyor.
        if status == 0{
            let value = String(data: ref as! Data, encoding: .utf8)
            print("Read :",value!)
        }else{
            print("Status code:",status)
        }
    }
    
    func dataUpdate(){
        let query = [
            kSecAttrAccount : "userName",//değerin değişken adı çağırırken kullanmak için
            kSecClass : kSecClassGenericPassword // şifreleme tipi
        ] as CFDictionary
        
        let updateDataQuery = [
            kSecValueData : "Celalettin Berat Altuntaş".data(using: .utf8)!
        ] as CFDictionary
        
        let status = SecItemUpdate(query, updateDataQuery)
        if status == 0{
            print("Data updated successfully. Status Code:",status)
        }else{
            print("Status code:",status)
        }
       
        
    }
    
    func dataDelete(){
        let query = [
            kSecAttrAccount : "userName",
            kSecClass : kSecClassGenericPassword
        ] as CFDictionary
        
        let status = SecItemDelete(query)
        
        if status == 0{
            print("Data Deleted successfully. Status Code:",status)
        }else{
            print("Status code:",status)
        }
    }
}

