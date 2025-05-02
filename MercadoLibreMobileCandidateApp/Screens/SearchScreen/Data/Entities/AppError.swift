//
//  NetworkError.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

enum AppError: Error, LocalizedError {
    case authorizationError
    case resourceNotFound
    case serverError(Int)
    case forbidenError
    case invalidURL
    case decodingError(Error)
    case networkError(URLError)
    case requestFailed(URLResponse?)
    case unknown(Error)
    case unableToFindJsonError
    case parsingError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "La URL no es válida."
        case .decodingError: return "Error al decodificar los datos."
        case .networkError(let err): return "Error de red: \(err.localizedDescription)"
        case .unknown(let err): return "\(err.localizedDescription)"
        case .unableToFindJsonError:
            return "Error al encontrar el JSON"
        case .parsingError:
            return "Error al decodificar el JSON"
        case .authorizationError:
            return "Error de autorización"
        case .resourceNotFound:
            return "No hemos encontrado el recurso"
        case .serverError(_):
            return "Error al conectarse con el servidor"
        case .forbidenError:
            return "Error de permisos"
        case .requestFailed(_):
            return "Error de resquest"
        }
    }
}

