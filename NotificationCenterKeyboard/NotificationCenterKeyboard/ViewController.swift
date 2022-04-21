//
//  ViewController.swift
//  NotificationCenterKeyboard
//
//  Created by BERAT ALTUNTAŞ on 21.04.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldBeginEditing), name: UITextField.textDidBeginEditingNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldChanging), name: UITextField.textDidChangeNotification, object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardOpened), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardClosed), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

    @IBAction func closeKeyboard_TUI(_ sender: Any) {
        textField.endEditing(true)
    }
    
    @objc func textFieldBeginEditing(){
        label.text = "textField begin editing"
    }
    
    @objc func textFieldChanging(){
        label.text = "textField changing"
    }
    
    @objc func keyboardOpened(){
        label.text = "keyboard opened"
    }
    
    @objc func keyboardClosed(){
        label.text = "keyboard closed"
    }
}

