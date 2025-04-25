//
//  MobileCandidateAPIDataManager.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import Combine

class MobileCandidateAPIDataManager: MobileCandidateAPIDataManagerProtocol {
    private let baseURL: String = "https://api.mercadolibre.com"
    private let searchProductsEndPoint: String = "/sites/MCO/search?q="

    private typealias productDetailResponse = AnyPublisher<MobileCandidateProductDTO, Error>
    
    func searchProducts(for query: String) -> AnyPublisher<MobileCandidateSearchProductsResultDTO, Error> {
        let urlString = "\(baseURL)\(searchProductsEndPoint)\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"

        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //request.setValue("Bearer APP_USR-7810428096286422-042417-5d09b9bfdbc9597d956ee643e52be895-188204268", forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: url)
            //.map(\.data)
            .map { output in
                if let jsonString = String(data: output.data, encoding: .utf8) {
                    print("Response Data: \(jsonString)")
                }
                return output.data
            }
            .decode(type: MobileCandidateSearchProductsResultDTO.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getProductDetail(for itemId: String) -> AnyPublisher<MobileCandidateProductDTO, Error> {
        let urlString = "\(baseURL)/items/\(itemId)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //request.setValue("Bearer APP_USR-7810428096286422-042417-5d09b9bfdbc9597d956ee643e52be895-188204268", forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: MobileCandidateProductDTO.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    /*
    private func makeRequest(url: URL, headers: [String: String] = [:]) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        return request
    }*/
}



