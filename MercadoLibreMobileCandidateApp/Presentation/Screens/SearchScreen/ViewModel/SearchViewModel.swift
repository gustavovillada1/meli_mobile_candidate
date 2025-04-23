//
//  SearchViewModel.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

final class SearchViewModel: SearchViewModelProtocol {
    
    // MARK: Atributes
    @Published var query: String = String()
    @Published var shouldShowSkeleton: Bool = false
    
    // MARK: Functions
    func onSearch() {
        
    }
}
