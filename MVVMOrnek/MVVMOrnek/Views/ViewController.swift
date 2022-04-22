//
//  ViewController.swift
//  MVVMOrnek
//
//  Created by BERAT ALTUNTAŞ on 23.04.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var personList = PersonList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personList.setPerson(person: PersonViewModel(person: Person(name: "berat", lastname: "Altuntas")))
        personList.setPerson(person: PersonViewModel(person: Person(name: "ismet", lastname: "yalçın")))
        personList.setPerson(personName: "erhan", personLastname: "toktamış")
        personList.setPerson(personName: "nida", personLastname: "yalçın")
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let person = personList.getPerson(index: indexPath.row)
        cell.textLabel?.text = "\(person.name)  \(person.lastname)"
        return cell
    }
}

