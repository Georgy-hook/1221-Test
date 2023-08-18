//
//  SchoolModel.swift
//  1221 Test
//
//  Created by Georgy on 18.08.2023.
//

import Foundation
import UIKit

struct SchoolModel{
    var image: UIImage
    var name: String
    var price: String
    var discountedPrice: String?
    var tags: [ProductTag]?
}

extension SchoolModel {
    static func fetchProducts() -> [SchoolModel] {
        let products: [SchoolModel] = [
            SchoolModel(image: UIImage(named: "9 Roses")!, name: "Букет из 9 кустовых роз", price: "1 990.00 ₽/шт"),
            SchoolModel(image: UIImage(named: "Merci")!, name: "Набор Конфет Merci Ассорти Горький Шоколад 250г", price: "239.90 ₽/шт", discountedPrice: "529.90", tags: [.priceDrop]),
            SchoolModel(image: UIImage(named: "5 Chrysanthemum")!, name: "Букет из 5 Хризантем", price: "699.00 ₽/шт"),
            SchoolModel(image: UIImage(named: "9 Gerber")!, name: "Букет из 9 Гербер", price: "1 890.00 ₽/шт"),
            SchoolModel(image: UIImage(named: "Merci 2")!, name: "Набор Конфет Merci Миндаль 250г", price: "239.90 ₽/шт", discountedPrice: "529.90", tags: [.priceDrop]),
            SchoolModel(image: UIImage(named: "15 Chrysanthemum")!, name: "Букет из 15 Хризантем", price: "2 190.00 ₽/шт"),
            SchoolModel(image: UIImage(named: "9 Roses Kenia")!, name: "Букет 9 Роз Кения", price: "899.00 ₽/шт"),
            SchoolModel(image: UIImage(named: "7 Roses Russia")!, name: "Букет 7 Роз Россия", price: "659.00 ₽/шт"),
            SchoolModel(image: UIImage(named: "Bolci")!, name: "Набор Конфет Bolci Diamond Ассорти 96г", price: "329.90 ₽/шт"),
            SchoolModel(image: UIImage(named: "9 Roses Russia")!, name: "Букет из 9 роз россия", price: "859.00 ₽/шт"),
        ]
        return products
    }
}

extension SchoolModel {
    static let leftDistanceToView: CGFloat = 10
    static let rightDistanceToView: CGFloat = 10
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - leftDistanceToView - rightDistanceToView - (galleryMinimumLineSpacing / 2) - 30) / 2.8
}
