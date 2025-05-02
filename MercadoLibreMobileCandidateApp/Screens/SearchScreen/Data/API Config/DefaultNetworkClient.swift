//
//  DefaultNetworkClient.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation
import Combine

class DefaultNetworkClient: NetworkClientProtocol {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    /// Performs a network request to the specified endpoint and decodes the response.
    ///
    /// - Parameters:
    ///   - endpoint: The path of the API endpoint to call (e.g., "/users").
    ///   - method: The HTTP method for the request (e.g., "GET", "POST").
    ///   - queryItems: An optional array of URL query items to include in the request URL.
    ///   - headers: An optional dictionary of HTTP headers to add to the request.
    ///
    /// - Returns: A publisher that emits the decoded data of type `T` on success, or an `AppError` on failure.
    func performRequest<T: Decodable>(endpoint: String, method: String, queryItems: [URLQueryItem]?, headers: [String: String]?) -> AnyPublisher<T, AppError> {
        guard var urlComponents = URLComponents(string: APIConfig.baseURL + endpoint) else {
            return Fail(error: AppError.invalidURL).eraseToAnyPublisher()
        }
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            return Fail(error: AppError.invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = APIConfig.defaultHeaders.merging(headers ?? [:]) { (current, new) in new }
        let statusCodeMapper = HTTPStatusCodeMapper()
        
        return session.dataTaskPublisher(for: request)
            .tryMap { output in
                _ = try statusCodeMapper.map(output.response)
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let decodingError = error as? DecodingError {
                    return .decodingError(decodingError)
                } else if let networkError = error as? AppError {
                    return networkError
                } else {
                    return .unknown(error)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
