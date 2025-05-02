//
//  SearchViewWireframe.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

public struct SearchViewWireframe {
    
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
    
    private static func createViewModel() -> SearchViewModel {
        let localizables: AppLocalizables = AppLocalizables()
        
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
            searchProductsUseCase: searchProductsUseCase
        )
    }
}
