//
//  StoriesCollectionView.swift
//  1221 Test
//
//  Created by Georgy on 16.08.2023.
//

import UIKit

class StoriesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var stories = [StoriesModel]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: StoriesCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = StoriesModel.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: StoriesModel.leftDistanceToView, bottom: 0, right: StoriesModel.rightDistanceToView)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    func set(stories: [StoriesModel]) {
        self.stories = stories
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: StoriesCollectionViewCell.reuseId, for: indexPath) as! StoriesCollectionViewCell
        cell.storyButton.setImage(stories[indexPath.row].mainImage, for: .normal)
        cell.smallDescriptionLabel.text = stories[indexPath.row].smallDescription
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: StoriesModel.galleryItemWidth, height: frame.height * 0.8)
    }
    
      

    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


