//
//  StoriesCollectionViewCell.swift
//  1221 Test
//
//  Created by Georgy on 16.08.2023.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "StoriesCollectionViewCell"
    
    var storyButton:StoryButton = {
        let storyButton = StoryButton(image: nil)
        return storyButton
    }()
    
    
    
    
    let smallDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(storyButton)
        addSubview(smallDescriptionLabel)
        
        backgroundColor = .white
        
        // mainImageView constraints
        storyButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        storyButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        storyButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        storyButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2/3).isActive = true
        
        // smallDescriptionLabel constraints
        smallDescriptionLabel.centerXAnchor.constraint(equalTo: storyButton.centerXAnchor).isActive = true
        smallDescriptionLabel.topAnchor.constraint(equalTo: storyButton.bottomAnchor, constant: 8).isActive = true
        smallDescriptionLabel.trailingAnchor.constraint(equalTo: storyButton.trailingAnchor).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5
        
        self.clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
