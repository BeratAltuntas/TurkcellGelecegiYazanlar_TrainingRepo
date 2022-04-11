//
//  HomeViewController.swift
//  LocalVeriTabani
//
//  Created by BERAT ALTUNTAŞ on 9.04.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = name!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
