//
//  MobileCandidateAPIDataManagerProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 22/04/25.
//

import Foundation
import Combine

protocol MobileCandidateAPIDataManagerProtocol {
    func searchProducts(for query: String) -> AnyPublisher< MobileCandidateSearchProductDTO, Error>
}
