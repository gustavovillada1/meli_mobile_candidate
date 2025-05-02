//
//  SearchProductResultsProductItemDTO.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation

struct SearchProductResultsProductItemDTO: Codable, Identifiable {
    let id: String
    let title: String
    let price: Double
    let currencyID: String
    let availableQuantity: Int
    let soldQuantity: Int
    let condition: String
    let permalink: String
    let thumbnail: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case currencyID = "currency_id"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case condition
        case permalink
        case thumbnail
    }
}
