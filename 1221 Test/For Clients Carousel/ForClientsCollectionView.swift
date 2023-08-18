//
//  ForClientsCollectionView.swift
//  1221 Test
//
//  Created by Georgy on 17.08.2023.
//

import UIKit

class ForClientsCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var forClientsImages = [ForClientsModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(ForClientsCollectionViewCell.self, forCellWithReuseIdentifier: ForClientsCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = ForClientsModel.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: ForClientsModel.leftDistanceToView, bottom: 0, right: ForClientsModel.rightDistanceToView)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        clipsToBounds = false
    }
    
    func set(forClientsImages: [ForClientsModel]) {
        self.forClientsImages = forClientsImages
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forClientsImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ForClientsCollectionViewCell.reuseId, for: indexPath) as! ForClientsCollectionViewCell
        cell.mainImageView.image = forClientsImages[indexPath.row].mainImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ForClientsModel.galleryItemWidth, height: frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

