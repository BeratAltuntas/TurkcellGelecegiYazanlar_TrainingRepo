    //
    //  ViewController.swift
    //  CoreDataApp
    //
    //  Created by BERAT ALTUNTAŞ on 11.04.2022.
    //
import CoreData
import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView:UITableView!
    var users = [Kullanicilar]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        loadUsers()
    }
    
    func loadUsers(){
        let fetchRequest : NSFetchRequest<Kullanicilar> = Kullanicilar.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        do{
            users = try getContext().fetch(fetchRequest)
            tableView.reloadData()
        }
        catch{
            print("hata")
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("UsersTVCell", owner: self)?.first as! UsersTVCell
        cell.labelName.text = "\(users[indexPath.row].name!)  \(users[indexPath.row].lastname!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sgEdit", sender: indexPath.row)
    }
    func getContext()-> NSManagedObjectContext{
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgEdit"{
            let targetVC = segue.destination as! CreateUserVC
            targetVC.person = users[sender as! Int]
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            getContext().delete(users[indexPath.row])
        }
        loadUsers()
    }
}

