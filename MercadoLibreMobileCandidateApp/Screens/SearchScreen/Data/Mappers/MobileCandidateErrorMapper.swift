//
//  MobileCandidateErrorMapper.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

struct MobileCandidateErrorMapper {
    func mapToLocalError(_ error: Error) -> MobileCandidateAPIError {
        guard let apiError: MobileCandidateAPIError = error as? MobileCandidateAPIError else { return .unknown(error)}
        
        switch apiError {
        case .invalidURL:
           return MobileCandidateAPIError.invalidURL
        case .decodingError:
            return MobileCandidateAPIError.decodingError
        case .networkError:
            return MobileCandidateAPIError.networkError(error as! URLError)
        case .unknown:
            return MobileCandidateAPIError.unknown(error)

        }
    }
}
