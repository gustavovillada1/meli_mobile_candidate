//
//  APIConfig.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation

struct APIConfig {
    
    /// The base URL for the Mercado Libre API.
    static let baseURL = "https://api.mercadolibre.com"
    
    /// Default HTTP headers to include in every request.
    static let defaultHeaders: [String: String] = [
        "Content-Type": "application/json",
        "Accept": "application/json"
    ]
}
