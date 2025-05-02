//
//  ProductDetailAttributeDTO.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation

struct ProductDetailAttributeDTO: Decodable {
    let id: String
    let name: String
    let valueName: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case valueName = "value_name"
    }
}
