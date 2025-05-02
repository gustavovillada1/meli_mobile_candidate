//
//  Repository.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import Combine

class Repository: RepositoryProtocol {
    
    private let errorMapper: NetworkErrorMapper
    private let dataMapper: RepositoryDataMapper
    private let apiManager: NetworkDataManagerProtocol
    private let localManager: LocalDataManagerProtocol
    
    init(
        errorMapper: NetworkErrorMapper,
        dataMapper: RepositoryDataMapper,
        apiManager: NetworkDataManagerProtocol,
        localManager: LocalDataManagerProtocol
    ) {
        self.errorMapper = errorMapper
        self.dataMapper = dataMapper
        self.apiManager = apiManager
        self.localManager = localManager
    }
    
    func getProducts(for query: String, fromJson: Bool) -> AnyPublisher<[ProductItemDomainModel], AppError> {
        if fromJson {
            localManager.getSearchProductsJson()
                .map(dataMapper.mapProductsResultData)
                .mapError(errorMapper.mapToLocalError)
                .eraseToAnyPublisher()
        } else  {
            apiManager.searchProducts(for: query)
                .map(dataMapper.mapProductsResultData)
                .mapError(errorMapper.mapToLocalError)
                .eraseToAnyPublisher()
        }
    }
    
    func getProductDetail(for itemId: String, fromJson: Bool) -> AnyPublisher<ProductDetailDomainModel, AppError> {
        if fromJson {
            localManager.getProductDetailJson()
                .map(dataMapper.mapProductDetailData)
                .mapError(errorMapper.mapToLocalError)
                .eraseToAnyPublisher()
        } else {
            apiManager.getProductDetail(for: itemId)
                .map(dataMapper.mapProductDetailData)
                .mapError(errorMapper.mapToLocalError)
                .eraseToAnyPublisher()
        }
    }
    
    
}
