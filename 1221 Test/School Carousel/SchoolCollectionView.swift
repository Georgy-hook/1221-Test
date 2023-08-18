//
//  SchoolCollectionView.swift
//  1221 Test
//
//  Created by Georgy on 18.08.2023.
//

import UIKit

class SchoolCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var products = [SchoolModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(SchoolCollectionViewCell.self, forCellWithReuseIdentifier: SchoolCollectionViewCell.reuseId)
        
        layout.minimumLineSpacing = SchoolModel.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: SchoolModel.leftDistanceToView, bottom: 0, right: SchoolModel.rightDistanceToView)
        contentInsetAdjustmentBehavior = .never

        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        clipsToBounds = false
    }
    
    func set(products: [SchoolModel]) {
        self.products = products
        reloadData() 
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SchoolCollectionViewCell.reuseId, for: indexPath) as! SchoolCollectionViewCell
        cell.configure(with: products[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SchoolModel.galleryItemWidth, height: frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
