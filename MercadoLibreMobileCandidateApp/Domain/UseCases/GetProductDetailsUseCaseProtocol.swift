//
//  GetProductDetailsUseCaseProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import Combine

protocol GetProductDetailsUseCaseProtocol {
    func execute(itemId: String) -> AnyPublisher<MobileCandidateProductModel, MobileCandidateAPIError>
}

final class GetProductDetailsUseCase: GetProductDetailsUseCaseProtocol {
    private let repository: MobileCandidateRepositoryProtocol
    private let domainMapper: MobileCandidateDomainMapper
    
    init(repository: MobileCandidateRepositoryProtocol, domainMapper: MobileCandidateDomainMapper) {
        self.repository = repository
        self.domainMapper = domainMapper
    }
    
    func execute(itemId: String) -> AnyPublisher<MobileCandidateProductModel, MobileCandidateAPIError> {
        repository.getProductDetail(for: itemId)
            .map(domainMapper.mapProductDetail)
            .eraseToAnyPublisher()
    }
    
}
