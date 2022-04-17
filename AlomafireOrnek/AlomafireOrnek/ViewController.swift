//
//  ViewController.swift
//  AlomafireOrnek
//
//  Created by BERAT ALTUNTAŞ on 17.04.2022.
//
import Alamofire
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headers: HTTPHeaders = [
            "Authorization" : "Key",
            "Accept" : "application/json"]
        //let urlReq = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users/1")!)
        //urlReq.headers = headers
        
        let url = "https://jsonplaceholder.typicode.com/users/1"
        AF.request(url,headers: headers).responseJSON { response in
            print(response)
            print("***********************************")
            debugPrint(response)
        }
    }


}

