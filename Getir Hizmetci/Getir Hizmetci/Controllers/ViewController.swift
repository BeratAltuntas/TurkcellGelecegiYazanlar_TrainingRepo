//
//  ViewController.swift
//  Getir Hizmetci
//
//  Created by BERAT ALTUNTAŞ on 20.04.2022.
//
import FirebaseAuth
import FirebaseDatabase
import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var girisYapButton: UIButton!
    var hizmetciler: [User]?
    override func viewDidLoad() {
        super.viewDidLoad()
//
       
//        if Auth.auth().currentUser != nil{
//            girisYapButton.isHidden = true
//        }
        
        fetchHizmetli()
    }
    func fetchHizmetli(){
        Database.database().reference().child("Users").observe(.value) { DataSnapshot in
            var tempUser: User
            if self.hizmetciler == nil{
                self.hizmetciler = []
            }else{
                self.hizmetciler?.removeAll()
            }
            
            for us in DataSnapshot.children{
                let value = (us as! DataSnapshot).value as! NSDictionary
                
                tempUser = User()
                tempUser.ad = value["ad"]as? String
                tempUser.soyad = value["soyad"]as? String
                tempUser.hizmet = value["hizmet"]as? String
                
                self.hizmetciler?.append(tempUser)
            }
            self.tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if hizmetciler != nil{
            return hizmetciler!.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ad = hizmetciler?[indexPath.row].ad ?? ""
        let soyad = hizmetciler?[indexPath.row].soyad ?? ""
        let hizmet = hizmetciler?[indexPath.row].hizmet ?? ""
        
        let cell = Bundle.main.loadNibNamed("TVC_Hizmetci", owner: self)as! TVC_Hizmetci
        cell.labelName?.text = ad + soyad
        cell.labelHizmet.text = hizmet
        return cell
        
    }


}

