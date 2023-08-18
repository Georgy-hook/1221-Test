//
//  SalesCollectionView.swift
//  1221 Test
//
//  Created by Georgy on 16.08.2023.
//

import UIKit

class SalesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var sales = [SalesModel]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(SalesCollectionViewCell.self, forCellWithReuseIdentifier: SalesCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = SalesModel.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: SalesModel.leftDistanceToView, bottom: 0, right: SalesModel.rightDistanceToView)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    func set(sales: [SalesModel]) {
        self.sales = sales
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SalesCollectionViewCell.reuseId, for: indexPath) as! SalesCollectionViewCell
        cell.mainImageView.image = sales[indexPath.row % self.sales.count].mainImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SalesModel.galleryItemWidth, height: frame.height)
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
