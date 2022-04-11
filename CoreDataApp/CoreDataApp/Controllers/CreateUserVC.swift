    //
    //  CreateUserVC.swift
    //  CoreDataApp
    //
    //  Created by BERAT ALTUNTAŞ on 11.04.2022.
    //
import CoreData
import UIKit

class CreateUserVC: UIViewController {
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldLastname: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    
    
    var person : Kullanicilar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        if person != nil{
            // edit
            textFieldName.text = person?.name
            textFieldLastname.text = person?.lastname
            textFieldEmail.text = person?.email
        }
    }
    
    func getContext()-> NSManagedObjectContext{
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func saveContext(){
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    @IBAction func createUser_TUI(_ sender: Any) {
        guard var name = textFieldName.text else{return}
        guard let lastName = textFieldLastname.text else{return}
        guard let email = textFieldEmail.text else{return}
        
        name = name.first!.uppercased() + name.dropFirst()
        
        if name.isEmpty || lastName.isEmpty || email.isEmpty{
            return
        }
        
        let context = getContext()
        if person == nil{
            guard let entity = NSEntityDescription.entity(forEntityName: "Kullanicilar", in: context) else {return}
            
            let saveUser = NSManagedObject(entity: entity, insertInto: context)
            saveUser.setValue(name, forKey: "name")
            saveUser.setValue(lastName, forKey: "lastname")
            saveUser.setValue(email, forKey: "email")
        }else{
            person?.name = name
            person?.lastname = lastName
            person?.email = email
        }
        
        saveContext()
        dismiss(animated: true)
    }
    
    
}
