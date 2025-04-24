//
//  MobileCandidateRepositoryProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import Combine

protocol MobileCandidateRepositoryProtocol {
    // MARK: Search Screen
    func getProducts(for query: String) -> AnyPublisher< MobileCandidateResultsDomainModel, MobileCandidateAPIError>
    
    // MARK: Product Detail Screen
    func getProductDetail(for itemId: String) -> AnyPublisher<MobileCandidateProductDomainModel, MobileCandidateAPIError>
}
