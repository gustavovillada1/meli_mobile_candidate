//
//  NetworkDataManager.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//
/*
import Foundation
import Combine

class NetworkDataManager: NetworkDataManagerProtocol {
    private let baseURL: String = "https://api.mercadolibre.com"
    private let searchProductsEndPoint: String = "/sites/MCO/search?q="
    private let productDetailsEndPoint: String = "/items/"

    func searchProducts(for query: String) -> AnyPublisher<SearchProductResultsDTO, Error> {
        let urlString = "\(baseURL)\(searchProductsEndPoint)\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"

        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let statusCodeMapper = HTTPStatusCodeMapper()
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                _ = try statusCodeMapper.map(output.response)
                return output.data
            }
            .decode(type: SearchProductResultsDTO.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getProductDetail(for itemId: String) -> AnyPublisher<ProductDetailDTO, Error> {
        let urlString = "\(baseURL)\(productDetailsEndPoint)\(itemId)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let statusCodeMapper = HTTPStatusCodeMapper()

        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                _ = try statusCodeMapper.map(output.response)

                if let jsonString = String(data: output.data, encoding: .utf8) {
                    print("Response Data: \(jsonString)")
                }
                return output.data
            }
            //.map(\.data)
            .decode(type: ProductDetailDTO.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
*/
import Foundation
import Combine

class NetworkDataManager: NetworkDataManagerProtocol {
    private let networkClient: NetworkClientProtocol

    private let searchProductsPath = "/sites/MCO/search"
    private let productDetailsPath = "/items/"

    init(networkClient: NetworkClientProtocol = DefaultNetworkClient()) {
        self.networkClient = networkClient
    }

    func searchProducts(for query: String) -> AnyPublisher<SearchProductResultsDTO, AppError> {
        let queryItems = [URLQueryItem(name: "q", value: query)]
        return networkClient.performRequest(
            endpoint: searchProductsPath,
            method: "GET",
            queryItems: queryItems, 
            headers: nil
        )
    }

    func getProductDetail(for itemId: String) -> AnyPublisher<ProductDetailDTO, AppError> {
        let endpoint = productDetailsPath + itemId
        return networkClient.performRequest(
            endpoint: endpoint, 
            method: "GET",
            queryItems: nil,
            headers: nil
        )
    }
}

