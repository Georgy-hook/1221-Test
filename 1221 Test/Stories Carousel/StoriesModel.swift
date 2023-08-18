//
//  StoriesModel.swift
//  1221 Test
//
//  Created by Georgy on 16.08.2023.
//

import UIKit

struct StoriesModel {
    var mainImage: UIImage
    var smallDescription: String
    
    static let leftDistanceToView: CGFloat = 10
    static let rightDistanceToView: CGFloat = 10
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - leftDistanceToView - rightDistanceToView - (galleryMinimumLineSpacing / 2)) / 4.5
    
    static func fetchStories() -> [StoriesModel] {
        let stories: [StoriesModel] = [
            StoriesModel(mainImage: UIImage(named: "Spar Logo")!, smallDescription: "Привилегии \"Мой SPAR\""),
            StoriesModel(mainImage: UIImage(named: "Social media")!, smallDescription: "Мы в соцсетях"),
            StoriesModel(mainImage: UIImage(named: "Klern")!, smallDescription: "KLERN"),
            StoriesModel(mainImage: UIImage(named: "Honey")!, smallDescription: "Медовый спас"),
            StoriesModel(mainImage: UIImage(named: "News")!, smallDescription: "Новинки недели"),
            StoriesModel(mainImage: UIImage(named: "Recipes")!, smallDescription: "Рецепты недели")
        ]
        return stories
    }
}

