//
//  PersonList.swift
//  MVVMOrnek
//
//  Created by BERAT ALTUNTAŞ on 23.04.2022.
//

import Foundation

class PersonList
{
    var personList = [PersonViewModel]()
    
    func getPerson(index: Int)-> PersonViewModel{
        return personList[index]
    }
    func getCount()-> Int{
        return personList.count
    }
    
    
    func setPerson(person: PersonViewModel){
        personList.append(person)
    }
    func setPerson(personName: String, personLastname: String){
        let tempPersonModel = Person(name: personName, lastname: personLastname)
        let tempPersonViewModel = PersonViewModel(person: tempPersonModel)
        personList.append(tempPersonViewModel)
    }
}
