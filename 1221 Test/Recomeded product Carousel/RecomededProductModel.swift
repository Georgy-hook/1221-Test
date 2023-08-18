//
//  RecomededProductModel.swift
//  1221 Test
//
//  Created by Georgy on 17.08.2023.
//

import UIKit

struct RecomededProductItem {
    var image: UIImage
    var name: String
    var price: String
    var discountedPrice: String?
    var tags: [ProductTag]
}

extension RecomededProductItem {
    static func fetchProducts() -> [RecomededProductItem] {
        let products: [RecomededProductItem] = [
            RecomededProductItem(image: UIImage(named: "Fish")!, name: "Тунец Натуральный Рыбное Дело 180г", price: "159 р/шт", tags: [.superPrice]),
            RecomededProductItem(image: UIImage(named: "Cheese")!, name: "Сыр Hochland Полутвердый Grundlander Нарезка 150г", price: "199.90 р/шт", discountedPrice: "259.90", tags: [.priceDrop]),
            RecomededProductItem(image: UIImage(named: "Naggets")!, name: "Наггетсы Куриные Хрустящие Мираторг 300г", price: "129.90 р/шт", discountedPrice: "199.90", tags: [.priceDrop]),
            RecomededProductItem(image: UIImage(named: "Cola")!, name: "Напиток Любимая Кола Газированная 1,5л пэт", price: "99.90 р/шт", tags: [.superPrice]),
            RecomededProductItem(image: UIImage(named: "Pizza")!, name: "Пицца Пепперони по Рецепту SPAR", price: "499 р/шт", discountedPrice: "549", tags: [.priceDrop]),
            RecomededProductItem(image: UIImage(named: "Cold Tea")!, name: "Чай Lipton Холодный Лимон 1л", price: "109.90 р/шт", tags: [.superPrice]),
            RecomededProductItem(image: UIImage(named: "Savoyardi big")!, name: "Печенье Antico Borgo Савоярди 400г", price: "339.90 р/шт", tags: [.new]),
            RecomededProductItem(image: UIImage(named: "Cookies")!, name: "Печенье Antico Borgo Слоеное Глазированное 200г", price: "219.90 р/шт", tags: [.new]),
            RecomededProductItem(image: UIImage(named: "Strawberry")!, name: "Клубника 250г", price: "229.90 р/шт", discountedPrice: "269.90", tags: [.priceDrop]),
            RecomededProductItem(image: UIImage(named: "Blueberry")!, name: "Голубика We Love Fresh 500г", price: "349.90 р/шт", tags: [.superPrice]),
            RecomededProductItem(image: UIImage(named: "Shrimp")!, name: "Креветки Королевские Свежемороженые 16/20 без Головы", price: "999.90 р/кг", discountedPrice: "1 199.90", tags: [.priceDrop])
        ]
        return products
    }
}

extension RecomededProductItem {
    static let leftDistanceToView: CGFloat = 10
    static let rightDistanceToView: CGFloat = 10
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - leftDistanceToView - rightDistanceToView - (galleryMinimumLineSpacing / 2) - 30) / 2.8
}
