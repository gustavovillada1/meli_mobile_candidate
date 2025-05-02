//
//  ProductDetailViewModel.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import Combine

public final class ProductDetailViewModel: ProductDetailViewModelProtocol {
    
    
    // MARK: Non observable objects
    let dependencies: ProductDetailViewDependencies
    let constants: ScreenConstants
    let localizables: AppLocalizables
    let getProductDetailsUseCase: GetProductDetailsUseCaseProtocol
    var productDetail: ProductDetailModel?
    var appError: AppError?
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()

    // MARK: Observable objects
    @Published var shouldShowLoader: Bool = false
    @Published var shouldLoadFromJSON: Bool = false

    // MARK: Initializer
    /// - Parameters:
    ///   - dependencies: Dependencies required for the product detail view.
    ///   - localizables: An instance of `AppLocalizables` for providing localized strings.
    ///   - constants: An instance of `ScreenConstants` for UI-related constants.
    ///   - getProductDetailsUseCase: An instance of `GetProductDetailsUseCaseProtocol` for fetching product details.
    init(
        dependencies: ProductDetailViewDependencies,
        localizables: AppLocalizables,
        constants: ScreenConstants,
        getProductDetailsUseCase: GetProductDetailsUseCaseProtocol
    ) {
        self.dependencies = dependencies
        self.localizables = localizables
        self.constants = constants
        self.getProductDetailsUseCase = getProductDetailsUseCase
    }
    
    // MARK: Functions
    /// Called when the view associated with this viewModel appears. Initiates the fetching of product details.
    func onAppear() {
        getProductDetailsAPI()
    }
    
    /// Triggers the fetching of product details, forcing the data to be loaded from a local JSON file (if enabled).
    func didTapOnGetJson() {
        shouldLoadFromJSON = true
        getProductDetailsAPI()
    }
    
    /// Initiates the API call to fetch the details of a specific product.
    func getProductDetailsAPI() {
        let productId = dependencies.productId
        shouldShowLoader = true
        appError = nil
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.getProductDetailsUseCase.execute(itemId: productId, fromJson: self.shouldLoadFromJSON)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { [weak self] response in
                        switch response {
                            
                        case .finished:
                            self?.shouldShowLoader = false
                        case .failure(let error):
                            self?.shouldShowLoader = false
                            self?.appError = error
                        }
                        self?.shouldLoadFromJSON = false
                    }, receiveValue: { productDetail in
                        self.productDetail = productDetail
                    }
                )
                .store(in: &self.cancellables)
        }
    }
    
}
