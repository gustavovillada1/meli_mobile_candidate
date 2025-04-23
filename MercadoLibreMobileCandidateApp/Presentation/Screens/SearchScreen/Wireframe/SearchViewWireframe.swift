//
//  SearchViewWireframe.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

final class SearchViewWireframe {
    
    static func getSearchView() -> some View {
        let navigation: MobileCandidateAppNavigation = MobileCandidateAppNavigation()
        let viewModel: SearchViewModel = createViewModel()
        let rootView: SearchView = SearchView(viewModel: viewModel)
        
        return NavigationView {
            rootView
        }
        .environmentObject(navigation)
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private static func createViewModel() -> SearchViewModel {
        return SearchViewModel()
    }
}
