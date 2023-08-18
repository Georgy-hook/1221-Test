//
//  ForClientsModel.swift
//  1221 Test
//
//  Created by Georgy on 17.08.2023.
//

import UIKit

struct ForClientsModel {
    
    var mainImage: UIImage
    
    static let leftDistanceToView: CGFloat = 10
    static let rightDistanceToView: CGFloat = 10
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - leftDistanceToView - rightDistanceToView - (galleryMinimumLineSpacing / 2) - 30) / 3.2
    
    static func fetchForClients() -> [ForClientsModel] {
        let forClientsImages: [ForClientsModel] = [
            ForClientsModel(mainImage: UIImage(named: "Coffee")!),
            ForClientsModel(mainImage: UIImage(named: "My Sales")!),
            ForClientsModel(mainImage: UIImage(named: "Gift card")!),
            ForClientsModel(mainImage: UIImage(named: "Delivery")!),
            ForClientsModel(mainImage: UIImage(named: "SparWine")!),
            ForClientsModel(mainImage: UIImage(named: "Stores nearby")!),
            ForClientsModel(mainImage: UIImage(named: "My addresses")!),
            ForClientsModel(mainImage: UIImage(named: "Delivery long")!),
            ForClientsModel(mainImage: UIImage(named: "Help me chat")!),
            ForClientsModel(mainImage: UIImage(named: "Buy and get")!),
            ForClientsModel(mainImage: UIImage(named: "Buys list")!)
        ]
        return forClientsImages
    }
}

