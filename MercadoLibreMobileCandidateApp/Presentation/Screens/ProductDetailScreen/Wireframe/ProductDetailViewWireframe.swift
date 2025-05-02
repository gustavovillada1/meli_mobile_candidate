//
//  ProductDetailViewWireframe.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

public struct ProductDetailViewWireframe {
    
    /// Creates and returns the Product Detail View for a given product ID.
    ///
    /// - Parameter productId: The unique identifier of the product to display.
    /// - Returns: A `View` representing the Product Detail screen.
    @ViewBuilder
    public static func getProductDetailView(with productId: String) -> some View {
        let viewModel: ProductDetailViewModel = createViewModel(with: productId)
        let productDetailView: ProductDetailView = ProductDetailView(viewModel: viewModel)
        
        productDetailView
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    /// Creates the `ProductDetailViewModel` with its necessary dependencies.
    ///
    /// - Parameter productId: The unique identifier of the product.
    /// - Returns: An instance of `ProductDetailViewModel`.
    private static func createViewModel(with productId: String) -> ProductDetailViewModel {
        let localizables: AppLocalizables = AppLocalizables()
        let constants: ScreenConstants = ScreenConstants()
        let localManager: LocalDataManagerProtocol = LocalDataManager()
        let apiManager: NetworkDataManagerProtocol = NetworkDataManager()
        let dataMapper: RepositoryDataMapper = RepositoryDataMapper()
        let networkErrorMapper: NetworkErrorMapper = NetworkErrorMapper()
        let domainMapper: DomainMapper = DomainMapper()
        let repository: Repository = Repository(
            errorMapper: networkErrorMapper,
            dataMapper: dataMapper,
            apiManager: apiManager,
            localManager: localManager
        )
        let getProductDetailsUseCase: GetProductDetailsUseCase = GetProductDetailsUseCase(
            repository: repository,
            domainMapper: domainMapper
        )
        let dependencies: ProductDetailViewDependencies = ProductDetailViewDependencies(productId: productId)
        
        return ProductDetailViewModel(
            dependencies: dependencies,
            localizables: localizables,
            constants: constants,
            getProductDetailsUseCase: getProductDetailsUseCase
        )
    }
}
