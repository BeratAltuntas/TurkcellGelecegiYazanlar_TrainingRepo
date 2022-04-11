//
//  ViewController.swift
//  FileManager
//
//  Created by BERAT ALTUNTAŞ on 12.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let icerik = """
dosyaAdi.txt dosyasının
içeriği burada yazanlardır.

"""
        let dosyaAdi = "dosyaAdi.txt"
        createFile(withContent: icerik,fileName: dosyaAdi)
        readFile(withFileName: dosyaAdi)
    }

    func createFile(withContent content:String, fileName:String){
        if let directoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let dosyaAdi = fileName
            let fileUrl = directoryUrl.appendingPathComponent(dosyaAdi)
            
            
            do{
                try content.write(to: fileUrl,atomically: false,encoding:.utf8)
            }
            catch{
                print("hata")
            }
        }
    }
    
    func readFile(withFileName fileName: String){
        if let directoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let fileUrl = directoryUrl.appendingPathComponent(fileName)
            
            do{
                let read = try String(contentsOf: fileUrl)
                print(read)
            }
            catch{
                
            }
        }
    }


}

