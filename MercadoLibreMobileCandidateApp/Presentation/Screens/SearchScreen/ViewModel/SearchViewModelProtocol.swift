//
//  SearchViewModelProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

protocol SearchViewModelProtocol: ObservableObject {
    
    // MARK: Properties
    var localizables: AppLocalizables { get }
    var constants: ScreenConstants { get }
    var query: String { get set }
    var errorType: AppError? { get set }
    var shouldShowSkeleton: Bool { get set }
    var shouldShowAlert: Bool { get set }
    var shouldLoadFromJSON: Bool { get set }
    var products: [ProductItemModel] { get set }
    var productIdSelected: String { get set }
    var searchProductsUseCase: SearchProductUseCaseProtocol { get }
    
    // MARK: Functions
    func onAppear()
    func onSearch()
    func didTapOnElement(for productId: String)
    func cleanProducts()
    func didTapOnCancelAlert()
    func didTapOnGetJson()

}
