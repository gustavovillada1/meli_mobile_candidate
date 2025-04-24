//
//  MobileCandidateAppNavigation.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

final class MobileCandidateAppNavigation: ObservableObject {

    @Published var isSearchViewActive: Bool = false
    @Published var isResultsViewActive: Bool = false
    @Published var isProductDetailViewActive: Bool = false

}
