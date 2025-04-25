//
//  SearchProductUseCaseTests.swift
//  MercadoLibreMobileCandidateAppTests
//
//  Created by Gustavo Adolfo Villada Molina on 24/04/25.
//

import XCTest
import Combine
@testable import MercadoLibreMobileCandidateApp

final class SearchProductUseCaseTests: XCTestCase {
    var sut: SearchProductUseCase!
    var mockRepository: MockRepository!
    var mockMapper: MockDomainMapper!
    var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        mockRepository = MockRepository()
        mockMapper = MockDomainMapper()
        sut = SearchProductUseCase(repository: mockRepository, domainMapper: mockMapper)
    }

    func test_execute_success_returnsMappedProducts() {
        // Given
        let mockDomainModel = MobileCandidateResultsDomainModel(results: [])
        let expectedProducts: [MobileCandidateProductModel] = [.mock()]
        mockRepository.stubbedResult = Just(mockDomainModel)
            .setFailureType(to: MobileCandidateAPIError.self)
            .eraseToAnyPublisher()

        mockMapper.stubbedMappedResults = expectedProducts

        // When
        let expectation = XCTestExpectation(description: "Receive mapped products")

        sut.execute(query: "iPhone")
            .sink(receiveCompletion: { _ in },
                  receiveValue: { products in
                      XCTAssertEqual(products, expectedProducts)
                      expectation.fulfill()
                  })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
}
