//
//  RecomendedProductCollectionView.swift
//  1221 Test
//
//  Created by Georgy on 17.08.2023.
//

import UIKit

class RecomendedProductCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var products = [RecomededProductItem]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(RecomendedProductCollectionViewCell.self, forCellWithReuseIdentifier: RecomendedProductCollectionViewCell.reuseId)
        
        layout.minimumLineSpacing = RecomededProductItem.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: RecomededProductItem.leftDistanceToView, bottom: 0, right: RecomededProductItem.rightDistanceToView)
        contentInsetAdjustmentBehavior = .never

        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        clipsToBounds = false
    }
    
    func set(products: [RecomededProductItem]) {
        self.products = products
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: RecomendedProductCollectionViewCell.reuseId, for: indexPath) as! RecomendedProductCollectionViewCell
        cell.configure(with: products[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: RecomededProductItem.galleryItemWidth, height: frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
