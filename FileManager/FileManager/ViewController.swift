//
//  ViewController.swift
//  FileManager
//
//  Created by BERAT ALTUNTAŞ on 12.04.2022.
//

import UIKit
import MobileCoreServices //

class ViewController: UIViewController, UIDocumentPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let icerik = """
dosyaAdi.txt dosyasının
içeriği burada yazanlardır.

"""
        let dosyaAdi = "dosyaAdi.txt"
        //createFile(withContent: icerik,fileName: dosyaAdi)
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
                print("error")
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
                print("error")
            }
        }
    }
    
    @IBAction func openFile_TUI(_ sender: Any) {
        let dpVC = UIDocumentPickerViewController(documentTypes: [String(kUTTypeText)], in: .import)
        dpVC.delegate = self
        dpVC.modalPresentationStyle = .formSheet
        present(dpVC, animated: true)
        
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        do{
            let data = try Data(contentsOf: urls[0])
            let content = String(data: data, encoding: .utf8)
            print(content!)
        }
        catch{
            print(error)
        }
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("vazgeçildi.")
    }


}

