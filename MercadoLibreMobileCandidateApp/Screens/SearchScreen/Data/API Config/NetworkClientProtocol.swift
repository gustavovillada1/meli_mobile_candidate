//
//  NetworkClientProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation
import Combine

protocol NetworkClientProtocol {
    
    /// Performs a network request to the specified endpoint.
    ///
    /// - Parameters:
    ///   - endpoint: The path of the API endpoint to call (e.g., "/users").
    ///   - method: The HTTP method for the request (e.g., "GET", "POST").
    ///   - queryItems: An optional array of URL query items to include in the request URL.
    ///   - headers: An optional dictionary of HTTP headers to add to the request.
    ///
    /// - Returns: A publisher that emits the decoded data of type `T` on success, or an `AppError` on failure.
    func performRequest<T: Decodable>(endpoint: String, method: String, queryItems: [URLQueryItem]?, headers: [String: String]?) -> AnyPublisher<T, AppError>
}
