//
//  ProductDetailModel.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation

struct ProductDetailModel {
    let id: String
    let title: String
    let price: Double
    let currencyID: String
    let availableQuantity: Int
    let soldQuantity: Int
    let condition: String
    let permalink: String
    let thumbnail: String?
    let pictures: [ProductDetailPictureModel]
    let warranty: String?
    let attributes: [ProductDetailAttributeModel]
}
