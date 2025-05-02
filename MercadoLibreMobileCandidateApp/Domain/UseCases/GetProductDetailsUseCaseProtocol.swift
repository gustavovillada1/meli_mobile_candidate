//
//  GetProductDetailsUseCaseProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import Combine

protocol GetProductDetailsUseCaseProtocol {
    func execute(itemId: String, fromJson: Bool) -> AnyPublisher<ProductDetailModel, AppError>
}

final class GetProductDetailsUseCase: GetProductDetailsUseCaseProtocol {
    private let repository: RepositoryProtocol
    private let domainMapper: DomainMapper
    
    init(repository: RepositoryProtocol, domainMapper: DomainMapper) {
        self.repository = repository
        self.domainMapper = domainMapper
    }
    
    func execute(itemId: String, fromJson: Bool) -> AnyPublisher<ProductDetailModel, AppError> {
        repository.getProductDetail(for: itemId, fromJson: fromJson)
            .map(domainMapper.mapProductDetail)
            .eraseToAnyPublisher()
    }
    
}
