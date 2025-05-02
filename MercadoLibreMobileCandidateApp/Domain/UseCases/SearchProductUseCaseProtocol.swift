//
//  SearchProductUseCaseProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import Combine

protocol SearchProductUseCaseProtocol {
    func execute(query: String, fromJson: Bool) -> AnyPublisher<[ProductItemModel], AppError>
}

class SearchProductUseCase: SearchProductUseCaseProtocol {
    private let repository: RepositoryProtocol
    private let domainMapper: DomainMapper
    
    init(
        repository: RepositoryProtocol,
        domainMapper: DomainMapper
    ) {
        self.repository = repository
        self.domainMapper = domainMapper
    }
    
    func execute(query: String, fromJson: Bool) -> AnyPublisher<[ProductItemModel], AppError> {
        repository.getProducts(for: query, fromJson: fromJson)
            .map(domainMapper.mapResult)
            .eraseToAnyPublisher()
    }
}
