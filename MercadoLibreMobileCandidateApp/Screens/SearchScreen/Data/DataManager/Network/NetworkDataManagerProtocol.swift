//
//  NetworkDataManagerProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 22/04/25.
//

import Foundation
import Combine

protocol NetworkDataManagerProtocol {
    
    // MARK: Search Screen
    
    /// This function triggers a network request to search for products that match
    /// the provided query. It returns a publisher that emits a
    /// `MobileCandidateSearchProductsResultDTO` upon success or an `Error` upon failure.
    ///
    /// - Parameter query: A `String` containing the search term to query products.
    /// - Returns: An `AnyPublisher` that publishes a `MobileCandidateSearchProductsResultDTO` on success,
    ///   or an `Error` if the request fails.
    func searchProducts(for query: String) -> AnyPublisher< SearchProductResultsDTO, Error>
    
    // MARK: Product Detail Screen
    
    /// This function performs a network request to retrieve the complete details
    /// of a specific product identified by its `itemId`. It returns a publisher that emits a
    /// `SearchProductResultsDTO` on success or an `Error` on failure.
    ///
    /// - Parameter itemId: A `String` representing the unique identifier of the product.
    /// - Returns: An `AnyPublisher` that publishes a `ProductDetailDTO` upon successful retrieval,
    ///   or an `Error` if the request fails.
    func getProductDetail(for itemId: String) -> AnyPublisher<ProductDetailDTO, Error>
}
