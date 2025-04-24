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
    var shouldShowAlert: Bool { get set }
    var products: [MobileCandidateProductModel] { get set }
    var productSelected: MobileCandidateProductModel { get set }
    var searchProductsUseCase: SearchProductsUseCaseProtocol { get }
    
    // MARK: Functions
    func onAppear()
    func onSearch()
    func didTapOnElement(for item: MobileCandidateProductModel)

}
