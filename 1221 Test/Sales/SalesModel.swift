//
//  SalesModel.swift
//  1221 Test
//
//  Created by Georgy on 16.08.2023.
//

import UIKit

struct SalesModel {
    var mainImage: UIImage
    
    static let leftDistanceToView: CGFloat = 10
    static let rightDistanceToView: CGFloat = 10
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - leftDistanceToView - rightDistanceToView - (galleryMinimumLineSpacing / 2) - 30)
    
    static func fetchSales() -> [SalesModel] {
        let sales: [SalesModel] = [
            SalesModel(mainImage: UIImage(named: "Wine")!),
            SalesModel(mainImage: UIImage(named: "Felix")!),
            SalesModel(mainImage: UIImage(named: "Fun company")!),
            SalesModel(mainImage: UIImage(named: "Kids")!),
            SalesModel(mainImage: UIImage(named: "Sezonnye")!),
            SalesModel(mainImage: UIImage(named: "Week")!),
            SalesModel(mainImage: UIImage(named: "Healthy food")!)
        ]
        return sales
    }
}

