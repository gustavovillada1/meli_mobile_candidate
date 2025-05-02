//
//  RepositoryProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import Combine

protocol RepositoryProtocol {

    // MARK: Search Screen
    
    /// This method is used on the search screen to fetch product results from the API Manager.
    /// It returns a publisher that emits a `MobileCandidateResultsDomainModel` on success
    /// or a `MobileCandidateAPIError` on failure.
    ///
    /// - Parameter query: A `String` containing the search term to query products.
    /// - Returns: An `AnyPublisher` that publishes a `MobileCandidateResultsDomainModel` on success,
    ///   or an `MobileCandidateAPIError` if the request fails.
    func getProducts(for query: String, fromJson: Bool) -> AnyPublisher< [ProductItemDomainModel], AppError>

    // MARK: Product Detail Screen
    
    /// This method is used on the product detail screen to fetch extended product data from the API Manager.
    /// It returns a publisher that emits a `MobileCandidateProductDomainModel` on success
    /// or a `MobileCandidateAPIError` on failure.
    ///
    /// - Parameter itemId: A `String` representing the unique identifier of the product.
    /// - Returns: An `AnyPublisher` that publishes a `MobileCandidateProductDomainModel` upon successful retrieval,
    ///   or an `MobileCandidateAPIError` if the request fails.
    func getProductDetail(for itemId: String, fromJson: Bool) -> AnyPublisher<ProductDetailDomainModel, AppError>
}
