//
//  MobileCandidateRepository.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import Combine

class MobileCandidateRepository: MobileCandidateRepositoryProtocol {
    private let errorMapper: MobileCandidateErrorMapper
    private let dataMapper: MobileCandidateRepositoryDataMapper
    private let apiManager: MobileCandidateAPIDataManagerProtocol
    
    init(
        errorMapper: MobileCandidateErrorMapper,
        dataMapper: MobileCandidateRepositoryDataMapper,
        apiManager: MobileCandidateAPIDataManagerProtocol
    ) {
        self.errorMapper = errorMapper
        self.dataMapper = dataMapper
        self.apiManager = apiManager
    }
    
    func getProducts(for query: String) -> AnyPublisher<MobileCandidateResultsDomainModel, MobileCandidateAPIError> {
        apiManager.searchProducts(for: query)
            .map(dataMapper.mapProductsResultData)
            .mapError(errorMapper.mapToLocalError)
            .eraseToAnyPublisher()
    }
    
    func getProductDetail(for itemId: String) -> AnyPublisher<MobileCandidateProductDomainModel, MobileCandidateAPIError> {
        apiManager.getProductDetail(for: itemId)
            .map(dataMapper.mapProductDetailData)
            .mapError(errorMapper.mapToLocalError)
            .eraseToAnyPublisher()
    }
    
    
}
