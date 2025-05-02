//
//  ProductDetailDTO.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

struct ProductDetailDTO: Decodable {
    let id: String
    let title: String
    let price: Double
    let currencyID: String
    let availableQuantity: Int
    let soldQuantity: Int
    let condition: String
    let permalink: String
    let thumbnail: String
    let pictures: [ProductDetailPictureDTO]
    let warranty: String?
    let attributes: [ProductDetailAttributeDTO]

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
        case pictures
        case warranty
        case attributes
    }
}
