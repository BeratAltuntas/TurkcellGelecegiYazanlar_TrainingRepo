    //
    //  SignupViewController.swift
    //  LocalVeriTabani
    //
    //  Created by BERAT ALTUNTAŞ on 9.04.2022.
    //
import CoreData
import UIKit


class SignupViewController: UIViewController {
    
    @IBOutlet weak var textFieldsView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        navigationItem.rightBarButtonItem?.isEnabled = false
      
    }
   
    func userSignUp(name: String, email: String, password: String)
    {
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "Kullanicilar", in: context) else {return}
        
        let saveUser = NSManagedObject(entity: entity, insertInto: context)
        saveUser.setValue(name, forKey: "name")
        saveUser.setValue(email, forKey: "email")
        saveUser.setValue(password, forKey: "password")
        
        saveData()
    }
    func getContext()-> NSManagedObjectContext
    {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    func saveData(){
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    @IBAction func Signup_TUI(_ sender: Any) {
        guard let name = nameTextField.text else{return}
        guard let email = emailTextField.text else{return}
        guard let password = passwordTextField.text else{return}
        
        if name.isEmpty || email.isEmpty || password.isEmpty{
            errorLabel.isHidden = false
            errorLabel.text = "Boş bırakmamalısınız."
            return
        }
        if isUserExist(email: email){
            errorLabel.textColor = .systemRed
            errorLabel.text = "Bu email önceden kayıt yapmış."
            errorLabel.isHidden = false
            return
        }
        else{
            userSignUp(name: name, email: email, password: password)
            errorLabel.textColor = .systemGreen
            errorLabel.text = "Kaydınız yapıldı. Giriş sayfasına yönlendiriliyorsunuz."
            errorLabel.isHidden = false
            let waitSecond = 2.0
            DispatchQueue.main.asyncAfter(deadline: .now() + waitSecond) {[weak self] in
                if let loginVC = self?.storyboard?.instantiateViewController(withIdentifier: "Login")as? LoginViewController
                {
                    loginVC.modalPresentationStyle = .fullScreen
                    self?.navigationController?.present(loginVC, animated: true)
                }
                
            }
            
        }
    }
    
    func isUserExist(email:String)->Bool{
        let fetchRequest : NSFetchRequest<Kullanicilar> = Kullanicilar.fetchRequest()
        do{
            let users = try getContext().fetch(fetchRequest)
            for user in users{
                if user.email == email{
                    return true
                }
            }
        }
        catch{
            return true
        }
        return false
    }
}
