//
//  SearchViewModelTests.swift
//  MercadoLibreMobileCandidateAppTests
//
//  Created by Gustavo Adolfo Villada Molina on 24/04/25.
//

import XCTest
import Combine
@testable import MercadoLibreMobileCandidateApp

final class SearchViewModelTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable> = []
    
    func test_onSearch_success_returnsProducts() {
        // Arrange
        let mockUseCase = MockSearchProductsUseCase()
        let expectedProducts = [
            MobileCandidateProductModel(id: "1", title: "iPhone", price: 1000, thumbnail: "", condition: "new", availableQuantity: 5, soldQuantity: 2),
            MobileCandidateProductModel(id: "2", title: "Samsung", price: 800, thumbnail: "", condition: "new", availableQuantity: 3, soldQuantity: 1)
        ]
        mockUseCase.result = .success(expectedProducts)
        let viewModel = SearchViewModel(searchProductsUseCase: mockUseCase)
        viewModel.query = "iphone"
        
        let expectation = XCTestExpectation(description: "Wait for search")

        // Act
        viewModel.$products
            .dropFirst()
            .sink { products in
                // Assert
                XCTAssertEqual(products.count, expectedProducts.count)
                XCTAssertEqual(products[0].title, "iPhone")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.onSearch()

        wait(for: [expectation], timeout: 2)
    }
    
    func test_onSearch_failure_setsEmptyProductsAndShowsAlert() {
        // Arrange
        let mockUseCase = MockSearchProductsUseCase()
        mockUseCase.result = .failure(.networkError)
        let viewModel = SearchViewModel(searchProductsUseCase: mockUseCase)
        viewModel.query = "ipad"
        
        let expectation = XCTestExpectation(description: "Wait for failure")

        viewModel.$shouldShowAlert
            .dropFirst()
            .sink { showAlert in
                XCTAssertTrue(showAlert)
                XCTAssertTrue(viewModel.products.isEmpty)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // Act
        viewModel.onSearch()
        
        wait(for: [expectation], timeout: 2)
    }
}
