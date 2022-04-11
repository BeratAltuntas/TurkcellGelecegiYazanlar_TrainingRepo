//
//  LoginViewController.swift
//  LocalVeriTabani
//
//  Created by BERAT ALTUNTAŞ on 9.04.2022.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    

    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginCheck_TUI(_ sender: Any) {
        guard let userEmail = userEmailTextField.text else{return}
        guard let userPassword = userPasswordTextField.text else{return}
        
        if userEmail.isEmpty || userPassword.isEmpty{
            return
        }
        
        let fetchRequest : NSFetchRequest<Kullanicilar> = Kullanicilar.fetchRequest()
        
        do{
            let users = try getContext().fetch(fetchRequest)
            
            for user in users{
                if user.email == userEmail && user.password == userPassword{
                    print("ok1")
                    if let homeVC = storyboard?.instantiateViewController(withIdentifier: "Home")as? HomeViewController
                    {
                        print("ok2")
                        homeVC.modalPresentationStyle = .fullScreen
                        homeVC.name = user.name!
                        navigationController?.present(homeVC, animated: true)
                    }
                }
            }
        }
        catch{
            print("hata")
        }
        
    }
    
    func getContext()-> NSManagedObjectContext
    {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
}
