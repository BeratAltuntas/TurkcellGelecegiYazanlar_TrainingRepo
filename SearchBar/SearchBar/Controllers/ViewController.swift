    //
    //  ViewController.swift
    //  SearchBar
    //
    //  Created by BERAT ALTUNTAŞ on 8.04.2022.
    //

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    var isSearching = false
    var list: [String] = ["Elma","Armut","Kiraz","Portakal","Limon","Erik","Ayva","Muz","Üzüm","Vişne","İğde","karpuz","Kavun","Şeftali","Ananas"]
    var filteredList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        addItem()
        
        
    }
    
    func addItem(){
        filteredList.append(contentsOf: list)
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = filteredList[indexPath.row] + " \(indexPath.row)"
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredList = list
            isSearching=false
        }
        else{
            filteredList = list.filter({ (str:String )->Bool in
                return str.range(of: searchText,options: .caseInsensitive) != nil
                
            })
            isSearching = true
        }
        
        tableView.reloadData()
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height) && !isSearching{
            addItem()
        }
    }
}

