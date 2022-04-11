//
//  ViewController.swift
//  LocalVeriTabani
//
//  Created by BERAT ALTUNTAŞ on 9.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rightBarButton: UIButton!
    var isThemeDark = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isThemeDark = !getTheme()
        changeTheme()
    }

    @IBAction func themeChange_TUI(_ sender: Any)
    {
        changeTheme()
        saveTheme(value: isThemeDark)
    }
    
    func changeTheme()
    {
        if isThemeDark
        {
            UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .light
            rightBarButton.imageView!.image = UIImage(systemName: "lightbulb.circle.fill")
            
            isThemeDark = !isThemeDark
        }else
        {
            UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .dark
            rightBarButton.imageView!.image = UIImage(systemName: "lightbulb.circle")
            isThemeDark = !isThemeDark
        }
    }
    func getTheme()->Bool
    {
        return UserDefaults.standard.bool(forKey: "theme")
    }
    func saveTheme(value: Bool)
    {
        let defaults = UserDefaults.standard
        defaults.setValue(value, forKey: "theme")
        defaults.synchronize()
    }

}

