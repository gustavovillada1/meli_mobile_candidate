//
//  SearchProductResultsDTO.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 22/04/25.
//

import Foundation

struct SearchProductResultsDTO: Decodable {
    let siteID: String
    let query: String
    let paging: SearchProductResultsPagingDTO
    let results: [SearchProductResultsProductItemDTO]

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case query
        case paging
        case results
    }
}
