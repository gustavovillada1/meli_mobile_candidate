//
//  NetworkErrorMapper.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

struct NetworkErrorMapper {
    
    /// Maps the given error to a local `AppError`.
    ///
    /// - Parameter error: The error to map.
    /// - Returns: The corresponding `AppError`.
    func mapToLocalError(_ error: Error) -> AppError {
        if let urlError = error as? URLError {
            switch urlError.code {
            case .badURL:
                return .invalidURL
            case .timedOut:
                return .networkError(urlError)
            case .notConnectedToInternet:
                return .networkError(urlError)
            default:
                return .networkError(urlError)
            }
        } else if error is DecodingError {
            return .decodingError(error)
        } else {
            return .unknown(error)
        }
    }
}

struct HTTPStatusCodeMapper {
    
    /// Maps the given URL response to `Data`, throwing an error for non-200 HTTP status codes.
    ///
    /// - Parameter response: The URL response to evaluate.
    /// - Returns: An empty `Data` object if the response status code is successful (200-299).
    /// - Throws: An `AppError` if the response status code indicates an error (e.g., 401, 404, 500).
    func map(_ response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw AppError.unknown(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Respuesta HTTP inválida"]))
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            switch httpResponse.statusCode {
            case 401:
                throw AppError.authorizationError
            case 403:
                throw AppError.forbidenError
            case 404:
                throw AppError.resourceNotFound
            case 500...599:
                throw AppError.serverError(httpResponse.statusCode)
            default:
                throw AppError.networkError(URLError(URLError.Code(rawValue: httpResponse.statusCode)))
            }
        }
        return Data()
    }
}
