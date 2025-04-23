//
//  SearchViewModelProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

protocol SearchViewModelProtocol: ObservableObject {
    
    // MARK: Properties
    var query: String { get set }
    var shouldShowSkeleton: Bool { get set }
    
    // MARK: Functions
    func onSearch()
    
}
