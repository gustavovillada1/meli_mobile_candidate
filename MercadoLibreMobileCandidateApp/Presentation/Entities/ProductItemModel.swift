//
//  MobileCandidateProductModel.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

public struct ProductItemModel {
    let id: String
    let title: String
    let price: Double
    let currencyID: String
    let availableQuantity: Int
    let soldQuantity: Int
    let condition: String
    let permalink: String
    let thumbnail: String?

    init(id: String, title: String, price: Double, currencyID: String, availableQuantity: Int, soldQuantity: Int, condition: String, permalink: String, thumbnail: String) {
        self.id = id
        self.title = title
        self.price = price
        self.currencyID = currencyID
        self.availableQuantity = availableQuantity
        self.soldQuantity = soldQuantity
        self.condition = condition
        self.permalink = permalink
        self.thumbnail = thumbnail
    }
    
}

