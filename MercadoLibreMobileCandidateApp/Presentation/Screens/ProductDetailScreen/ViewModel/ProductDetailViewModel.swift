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
    let localizables: AppLocalizables
    let getProductDetailsUseCase: GetProductDetailsUseCaseProtocol
    var productDetail: ProductDetailModel?
    var appError: AppError?
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()

    // MARK: Observable objects
    @Published var shouldShowLoader: Bool = false
    @Published var shouldLoadFromJSON: Bool = false

    init(
        dependencies: ProductDetailViewDependencies,
        localizables: AppLocalizables,
        getProductDetailsUseCase: GetProductDetailsUseCaseProtocol
    ) {
        self.dependencies = dependencies
        self.localizables = localizables
        self.getProductDetailsUseCase = getProductDetailsUseCase
    }
    
    // MARK: Functions
    func onAppear() {
        getProductDetailsAPI()
    }
    
    func didTapOnGetJson() {
        shouldLoadFromJSON = true
        getProductDetailsAPI()
    }
    
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
