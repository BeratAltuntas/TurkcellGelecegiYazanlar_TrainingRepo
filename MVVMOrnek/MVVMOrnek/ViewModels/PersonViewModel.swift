//
//  PersonViewModel.swift
//  MVVMOrnek
//
//  Created by BERAT ALTUNTAŞ on 23.04.2022.
//

import Foundation

class PersonViewModel
{
    var person: Person
    
    var name: String{return person.name!}
    var lastname: String{return person.lastname!}
    
    init(person:Person){
        self.person = person
    }
}
