//
//  SearchViewModel.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import Combine

public final class SearchViewModel: SearchViewModelProtocol {
    
    // MARK: Non observables
    let localizables: AppLocalizables
    let constants: ScreenConstants
    let searchProductsUseCase: SearchProductUseCaseProtocol
    var products: [ProductItemModel] = []
    var productIdSelected: String = String()
    var shouldLoadFromJSON: Bool = false
    var errorType: AppError?
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    // MARK: Observables
    @Published var shouldShowSkeleton: Bool = true
    @Published var shouldShowAlert: Bool = false
    @Published var query: String = String()
    
    // MARK: Initializer
    
    /// Initializes a new `SearchViewModel`.
    ///
    /// - Parameters:
    ///   - localizables: An instance of `AppLocalizables` for providing localized strings.
    ///   - constants: An instance of `ScreenConstants` for UI-related constants.
    ///   - searchProductsUseCase: An instance of `SearchProductUseCaseProtocol` for fetching search results.
    init(
        localizables: AppLocalizables,
        constants: ScreenConstants,
        searchProductsUseCase: SearchProductUseCaseProtocol
    ) {
        self.localizables = localizables
        self.constants = constants
        self.searchProductsUseCase = searchProductsUseCase
    }
    
    // MARK: Functions
    func onAppear() { }
    
    /// Initiates the product search based on the current `query`.
    func onSearch() {
        shouldShowSkeleton = true
        errorType = nil
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.searchProductsUseCase.execute(
                query: self.query,
                fromJson: self.shouldLoadFromJSON
            )
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] response in
                    
                    switch response {
                    case .finished:
                        self?.onSearchFinished()
                    case .failure(let error):
                        self?.onSearchFailure(error)
                    }
                    self?.shouldLoadFromJSON = false
                }, receiveValue: { products in
                    self.products = products
                }
            )
            .store(in: &self.cancellables)
        }
    }
    
    /// Called when the product search completes successfully.
    private func onSearchFinished() {
        shouldShowSkeleton = false
    }
    
    /// Called when the product search fails. Updates the error state and triggers the alert display.
    ///
    /// - Parameter error: The `AppError` that occurred during the search.
    private func onSearchFailure(_ error: AppError) {
        errorType = error
        shouldShowSkeleton = false
        shouldShowAlert = true
    }
}
