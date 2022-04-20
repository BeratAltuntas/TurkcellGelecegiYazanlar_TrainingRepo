//
//  Login_VC.swift
//  
//
//  Created by BERAT ALTUNTAŞ on 20.04.2022.
//
import FirebaseAuth
import FirebaseDatabase
import UIKit

class Login_VC: UIViewController {

    
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var lastNameTextField:UITextField!
    @IBOutlet var hizmetTextField:UITextField!
    @IBOutlet var passwordTextField:UITextField!
    @IBOutlet var epostaTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func login_TUI(_ sender: Any){
        guard let eposta = epostaTextField.text else {return}
        guard let sifre = epostaTextField.text else {return}
        
        if !eposta.isEmpty && !sifre.isEmpty{
            Auth.auth().createUser(withEmail: eposta, password: sifre) { authResult, error in
                if error != nil{
                    print(error!.localizedDescription)
                }else{
                    self.hizmetKaydet()
                }
            }
            
        }
        
    }
    
    func hizmetKaydet(){
        
        let tempUser = User()
        tempUser.ad = nameTextField.text
        tempUser.soyad = lastNameTextField.text
        tempUser.hizmet = hizmetTextField.text
        
        let tempDictionary = [
            "ad":tempUser.ad,
            "soyad": tempUser.soyad,
            "hizmet": tempUser.hizmet
        ]
        
        let ref = Database.database().reference()
        ref.child("Users").child(Auth.auth().currentUser!.uid).setValue(tempDictionary)
        
        dismiss(animated: true)
    }

}
