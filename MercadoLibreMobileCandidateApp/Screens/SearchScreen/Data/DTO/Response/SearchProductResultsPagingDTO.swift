//
//  SearchProductResultsPagingDTO.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation

struct SearchProductResultsPagingDTO: Decodable {
    let total: Int
    let primaryResults: Int
    let offset: Int
    let limit: Int

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset
        case limit
    }
}
