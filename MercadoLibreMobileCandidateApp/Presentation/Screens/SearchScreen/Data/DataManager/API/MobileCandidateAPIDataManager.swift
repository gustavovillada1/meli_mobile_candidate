//
//  MobileCandidateAPIDataManager.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import Combine

class MobileCandidateAPIDataManager: MobileCandidateAPIDataManagerProtocol {
    private let baseURL = "https://api.mercadolibre.com"

    private typealias productDetailResponse = AnyPublisher<MobileCandidateProductDTO, Error>
    
    func getProducts(for query: String) -> AnyPublisher<MobileCandidateProductResultsDTO, Error> {
        let urlString = "\(baseURL)/sites/MLA/search?q=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"

        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        let request = makeRequest(url: url, headers: [
            "Content-Type": "application/json"
            // "Authorization": "Bearer <token>" // si necesitas autenticación
        ])

        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: MobileCandidateProductResultsDTO.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getProductDetail(for itemId: String) -> AnyPublisher<MobileCandidateProductDTO, Error> {
        let urlString = "\(baseURL)/items/\(itemId)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        let request = makeRequest(url: url, headers: [
            "Content-Type": "application/json"
            // "Authorization": "Bearer <token>" // si necesitas autenticación
        ])
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: MobileCandidateProductDTO.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private func makeRequest(url: URL, headers: [String: String] = [:]) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}



