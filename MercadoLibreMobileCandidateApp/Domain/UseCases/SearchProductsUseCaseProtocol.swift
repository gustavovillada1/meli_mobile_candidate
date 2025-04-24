//
//  SearchProductsUseCaseProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import Combine

protocol SearchProductsUseCaseProtocol {
    func execute(query: String) -> AnyPublisher<[MobileCandidateProductModel], MobileCandidateAPIError>
}

class SearchProductUseCase: SearchProductsUseCaseProtocol {
    private let repository: MobileCandidateRepositoryProtocol
    private let domainMapper: MobileCandidateDomainMapper
    
    init(
        repository: MobileCandidateRepositoryProtocol,
        domainMapper: MobileCandidateDomainMapper
    ) {
        self.repository = repository
        self.domainMapper = domainMapper
    }
    
    func execute(query: String) -> AnyPublisher<[MobileCandidateProductModel], MobileCandidateAPIError> {
        repository.getProducts(for: query)
            .map(domainMapper.mapResult)
            .eraseToAnyPublisher()
    }
}
