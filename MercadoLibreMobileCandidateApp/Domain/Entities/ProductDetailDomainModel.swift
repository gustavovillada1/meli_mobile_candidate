//
//  MobileCandidateProductDomainModel.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

struct ProductDetailDomainModel {
    let id: String
    let title: String
    let price: Double
    let currencyID: String
    let availableQuantity: Int
    let soldQuantity: Int
    let condition: String
    let permalink: String
    let thumbnail: String
    let pictures: [ProductDetailPictureDomainModel]
    let warranty: String?
    let attributes: [ProductDetailAttributeDomainModel]
}
