//
//  LocalDataManagerProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 30/04/25.
//

import Foundation
import Combine

protocol LocalDataManagerProtocol {
    
    /// Loads mock search results from a local JSON file.
    /// - Returns: A publisher emitting `SearchProductResultsDTO` or an error.
    func getSearchProductsJson() -> AnyPublisher<SearchProductResultsDTO, Error>

    /// Loads mock product detail from a local JSON file.
    /// - Returns: A publisher emitting `ProductDetailDTO` or an error.
    func getProductDetailJson() -> AnyPublisher<ProductDetailDTO, Error>
}
