//
//  MockSearchProductsUseCaseTest.swift
//  MercadoLibreMobileCandidateAppTests
//
//  Created by Gustavo Adolfo Villada Molina on 24/04/25.
//

import Foundation
import Combine
@testable import MercadoLibreMobileCandidateApp

class MockSearchProductsUseCase: SearchProductUseCaseProtocol {
    var result: Result<[ProductItemModel], AppError> = .success([])
    
    func execute(query: String) -> AnyPublisher<[ProductItemModel], AppError> {
        return result.publisher
            .delay(for: .seconds(0), scheduler: DispatchQueue.main) // Simular async
            .eraseToAnyPublisher()
    }
}
