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
        let apiManager: MobileCandidateAPIDataManager = MobileCandidateAPIDataManager()
        
        let errorMapper: MobileCandidateErrorMapper = MobileCandidateErrorMapper()
        
        let dataMapper: MobileCandidateRepositoryDataMapper = MobileCandidateRepositoryDataMapper()
        
        let repository: MobileCandidateRepository = MobileCandidateRepository(
            errorMapper: errorMapper,
            dataMapper: dataMapper,
            apiManager: apiManager
        )
        
        let domainMapper: MobileCandidateDomainMapper = MobileCandidateDomainMapper()
        
        let searchProductsUseCase: SearchProductUseCase = SearchProductUseCase(
            repository: repository,
            domainMapper: domainMapper
        )
        
        return SearchViewModel(searchProductsUseCase: searchProductsUseCase)
    }
}
