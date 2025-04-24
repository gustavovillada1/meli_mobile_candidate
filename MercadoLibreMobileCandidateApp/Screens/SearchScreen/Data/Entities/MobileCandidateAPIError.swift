//
//  MobileCandidateAPIError.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

enum MobileCandidateAPIError: Error, LocalizedError {
    case invalidURL
    case decodingError
    case networkError(URLError)
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "La URL no es válida."
        case .decodingError: return "Error al decodificar los datos."
        case .networkError(let err): return "Error de red: \(err.localizedDescription)"
        case .unknown(let err): return "Error desconocido: \(err.localizedDescription)"
        }
    }
}

