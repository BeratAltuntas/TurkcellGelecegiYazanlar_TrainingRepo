//
//  ViewController.swift
//  CustomCellXibssss
//
//  Created by BERAT ALTUNTAŞ on 8.04.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    @IBOutlet var tableView:UITableView!
    var liste = ["ELEMAN 1","ELEMAN 2"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TVC_Satir", owner: self)?.first as! TVC_Satir
        cell.lbl_Metin.text = liste[indexPath.row]
        
        return cell
    }
    

}

