//
//  LocalDataManager.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 30/04/25.
//

import Foundation
import Combine

class LocalDataManager: LocalDataManagerProtocol {
    
    let searchProductsJson: String = "search_products"
    let productDetailJson: String = "product_detail"
    
    // MARK: Functions

    func getSearchProductsJson() -> AnyPublisher<SearchProductResultsDTO, Error> {
        loadLocalJson(fileName: searchProductsJson, modelType: SearchProductResultsDTO.self)
    }
    
    func getProductDetailJson() -> AnyPublisher<ProductDetailDTO, Error> {
        loadLocalJson(fileName: productDetailJson, modelType: ProductDetailDTO.self)
    }
    
    /// Loads and decodes a local JSON file into a specified Decodable model type.
    /// - Parameters:
    ///   - fileName: The name of the JSON file (without extension).
    ///   - modelType: The model type conforming to Decodable.
    /// - Returns: A publisher that emits the decoded model or an error.
    private func loadLocalJson<T: Decodable>(fileName: String, modelType: T.Type) -> AnyPublisher<T, Error> {
        Future { promise in
            guard let jsonURL: URL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
                promise(.failure(AppError.unableToFindJsonError))
                return
            }
            do {
                let json: Data = try Data(contentsOf: jsonURL)
                let decoder: JSONDecoder = JSONDecoder()
                let model: T = try decoder.decode(T.self, from: json)
                promise(.success(model))
            } catch {
                promise(.failure(AppError.parsingError))
            }
        }
        .eraseToAnyPublisher()
    }
    
}

