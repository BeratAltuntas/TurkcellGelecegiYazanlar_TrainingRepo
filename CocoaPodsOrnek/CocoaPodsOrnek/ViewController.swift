//
//  ViewController.swift
//  CocoaPodsOrnek
//
//  Created by BERAT ALTUNTAŞ on 12.04.2022.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var persons = [Person]()
        let jsonStr = "[{\"firstName\":\"John\", \"lastName\":\"Doe\"},{\"firstName\":\"Anna\", \"lastName\":\"Smith\"},        {\"firstName\":\"Peter\", \"lastName\":\"Jones\"}]"
        
        if let jsonData = jsonStr.data(using: .utf8){
            let Json = JSON(jsonData)
            var person : Person
            for j in Json.arrayValue{
                person = Person(Name: j["firstName"].stringValue, Lastname: j["lastName"].stringValue)
                persons.append(person)
            }
            
        
        }
        
        for person in persons {
            print(person.firstName , person.lastname)
        }
    }


}

class Person{
    var firstName : String
    var lastname: String
    
    init(Name: String, Lastname: String){
        firstName = Name
        lastname = Lastname
    }
}

