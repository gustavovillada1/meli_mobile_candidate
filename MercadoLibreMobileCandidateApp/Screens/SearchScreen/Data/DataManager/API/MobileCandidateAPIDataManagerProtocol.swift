//
//  MobileCandidateAPIDataManagerProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 22/04/25.
//

import Foundation
import Combine

protocol MobileCandidateAPIDataManagerProtocol {
    
    // MARK: Search Screen
    func searchProducts(for query: String) -> AnyPublisher< MobileCandidateSearchProductsResultDTO, Error>
    
    // MARK: Product Detail Screen
    func getProductDetail(for itemId: String) -> AnyPublisher<MobileCandidateProductDTO, Error>
}
