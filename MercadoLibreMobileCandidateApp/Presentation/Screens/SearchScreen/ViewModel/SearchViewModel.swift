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
    let searchProductsUseCase: SearchProductUseCaseProtocol
    var products: [ProductItemModel] = []
    var productIdSelected: String = String()
    var shouldLoadFromJSON: Bool = false
    var query: String = String()
    var errorType: AppError?
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()

    // MARK: Observables
    @Published var shouldShowSkeleton: Bool = true
    @Published var shouldShowAlert: Bool = false
    
    // MARK: Initializer
    init(
        localizables: AppLocalizables,
        searchProductsUseCase: SearchProductUseCaseProtocol
    ) {
        self.localizables = localizables
        self.searchProductsUseCase = searchProductsUseCase
    }
    
    // MARK: Functions
    func onAppear() { }
    
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
    
    private func onSearchFinished() {
        shouldShowSkeleton = false
    }
    
    private func onSearchFailure(_ error: AppError) {
        errorType = error
        shouldShowSkeleton = false
        shouldShowAlert = true
    }
}
