//
//  SearchViewWireframe.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

public struct SearchViewWireframe {
    
    /// Creates and returns the main Search View.
    ///
    /// - Returns: A `View` representing the initial Search screen, embedded in a `NavigationView`.
    @ViewBuilder
    public static func getSearchView() -> some View {
        let navigation: MobileCandidateAppNavigation = MobileCandidateAppNavigation()
        let viewModel: SearchViewModel = createViewModel()
        let rootView: SearchView = SearchView(viewModel: viewModel)
        
        NavigationView {
            rootView
        }
        .environmentObject(navigation)
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    /// Creates the `SearchViewModel` with its necessary dependencies.
    ///
    /// - Returns: An instance of `SearchViewModel`.
    private static func createViewModel() -> SearchViewModel {
        let localizables: AppLocalizables = AppLocalizables()
        let constants: ScreenConstants = ScreenConstants()
        let apiManager: NetworkDataManager = NetworkDataManager()
        let localManager: LocalDataManager = LocalDataManager()
        let errorMapper: NetworkErrorMapper = NetworkErrorMapper()
        let dataMapper: RepositoryDataMapper = RepositoryDataMapper()
        let repository: Repository = Repository(
            errorMapper: errorMapper,
            dataMapper: dataMapper,
            apiManager: apiManager,
            localManager: localManager
        )
        let domainMapper: DomainMapper = DomainMapper()
        let searchProductsUseCase: SearchProductUseCase = SearchProductUseCase(
            repository: repository,
            domainMapper: domainMapper
        )
        return SearchViewModel(
            localizables: localizables,
            constants: constants,
            searchProductsUseCase: searchProductsUseCase
        )
    }
}
