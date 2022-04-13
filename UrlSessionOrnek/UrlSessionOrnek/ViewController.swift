//
//  ViewController.swift
//  UrlSessionOrnek
//
//  Created by BERAT ALTUNTAŞ on 13.04.2022.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet var tableView: UITableView!
    
    var persons = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        
//        var header = [String: String]()
//        header["Content-Type"] = "application/json"
//
//        request.allHTTPHeaderFields = header
        
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if error != nil{
                
            }else{
                let response = urlResponse as! HTTPURLResponse
                if response.statusCode == 200{
                    // bağlantı kuruldu.
                    do{
                        let decoder = JSONDecoder()
                        let decode = try! decoder.decode([Person].self, from: data!)
                        for d in decode{
                            self.persons.append(d)
                        }
                    }
                    catch {
                        print("error")
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }else{
                    // hata oluştu.
                }
            }
        }.resume()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell",for: indexPath)
        cell.textLabel?.text = persons[indexPath.row].name + persons[indexPath.row].email
        return cell
    }

}

