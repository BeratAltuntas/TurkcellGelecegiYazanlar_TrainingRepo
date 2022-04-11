//
//  CollectionFlowLayout.swift
//  CollectionViewFlowLayout
//
//  Created by BERAT ALTUNTAŞ on 8.04.2022.
//

import UIKit

class CollectionFlowLayout: UICollectionViewFlowLayout {

    var sutunSayisi: Int
    var yukseklikOranı: CGFloat = (2.0 / 3.0)
    
    init(sutunSayisi:Int, minSutunAraligi:CGFloat = 10, minSatirAraligi:CGFloat = 10) {
        
        self.sutunSayisi = sutunSayisi
        super.init()
        minimumInteritemSpacing = minSutunAraligi
        minimumLineSpacing = minSatirAraligi
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collView = collectionView else{return}
        
        let araliklar = collView.safeAreaInsets.left + collView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(sutunSayisi - 1)
        
        let elemanGenisligi = ((collView.bounds.size.width - araliklar) / CGFloat(sutunSayisi)).rounded(.down)
        let elemanYuksekligi = elemanGenisligi * yukseklikOranı
        
        itemSize = CGSize(width: elemanGenisligi, height: elemanYuksekligi)
    
    }
    
    
    

    
}
