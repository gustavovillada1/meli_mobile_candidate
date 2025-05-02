//
//  ResultsViewModel.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

extension SearchViewModel {
    
    func didTapOnElement(for productId: String) {
        productIdSelected = productId
    }
    
    func cleanProducts() {
        if !products.isEmpty {
            products.removeAll()
        }
    }
    
    func didTapOnGetJson() {
        DispatchQueue.main.async { [weak self] in
            self?.shouldLoadFromJSON = true
            self?.onSearch()
        }
    }
    
    func didTapOnCancelAlert() {
        DispatchQueue.main.async { [weak self] in
            self?.shouldLoadFromJSON = false
        }
    }
}
