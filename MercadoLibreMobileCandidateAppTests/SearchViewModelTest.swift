//
//  SearchViewModelTest.swift
//  MercadoLibreMobileCandidateAppTests
//
//  Created by Gustavo Adolfo Villada Molina on 24/04/25.
//

import Foundation
import XCTest
import Combine
@testable import MercadoLibreMobileCandidateApp

final class SearchViewModelTests: XCTestCase {
    var viewModel: SearchViewModel!
    var mockUseCase: MockSearchProductsUseCase!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockSearchProductsUseCase()
        viewModel = SearchViewModel(searchProductsUseCase: mockUseCase)
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        cancellables = nil
        super.tearDown()
    }
    
    func test_onSearch_successResponse_shouldUpdateProductsAndHideSkeleton() {
        // Given
        let products = [
            MobileCandidateProductModel(id: "1", name: "iPhone", description: "", rating: 5, price: 1000, imageUrl: "")
        ]
        mockUseCase.result = .success(products)
        viewModel.query = "iPhone"
        
        let expectation = self.expectation(description: "Wait for search to complete")
        
        // When
        viewModel.onSearch()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            // Then
            XCTAssertFalse(self.viewModel.shouldShowSkeleton)
            XCTAssertFalse(self.viewModel.shouldShowAlert)
            XCTAssertEqual(self.viewModel.products.count, 4) // Por hardcode del ViewModel
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 3)
    }

    func test_onSearch_failureResponse_shouldShowAlert() {
        // Given
        mockUseCase.result = .failure(.invalidURL)
        viewModel.query = "fail"
        
        let expectation = self.expectation(description: "Wait for search to complete")

        // When
        viewModel.onSearch()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            // Then
            XCTAssertFalse(self.viewModel.shouldShowSkeleton)
            XCTAssertTrue(self.viewModel.shouldShowAlert)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 3)
    }
}
