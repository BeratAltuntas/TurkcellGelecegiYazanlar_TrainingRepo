//
//  ViewController.swift
//  CollectionViewFlowLayout
//
//  Created by BERAT ALTUNTAŞ on 8.04.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource{

    
    
    @IBOutlet var collectionView:UICollectionView!
    
    var list = ["eleman1","eleman2","eleman3","eleman4","eleman5","eleman6","eleman7","eleman8","eleman9","eleman10"]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        collectionView.collectionViewLayout = CollectionFlowLayout.init(sutunSayisi: 1, minSutunAraligi: 50, minSatirAraligi: 50)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.label_ItemName.text = list[indexPath.row]
        cell.label_ItemIndex.text = String(indexPath.row)
        return cell
    }
    
}

