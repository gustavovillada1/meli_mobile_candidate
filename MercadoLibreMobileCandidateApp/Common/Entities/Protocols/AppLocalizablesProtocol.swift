//
//  AppLocalizablesProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation

protocol AppLocalizablesProtocol {
    
    // MARK: Common Strings
    var resultsString: String { get }
    var newString: String { get }
    var usedString: String { get }
    var technicalTest: String { get }
    var loadingString: String { get }
    
    // MARK: Search Screen
    var searchScreenHelloString: String { get }
    var searchScreenHelloSubtitleString: String { get }
    var searchScreenTextFieldHintString: String { get }
    
    // MARK: Results Screen
    var resultsScreenLoadingSubMessagge: String { get }
    
    // MARK: Product Detail Screen
    var productDetailScreenSoldQuantitySubfixString: String { get }
    var productDetailScreenProductAttributesTitle: String { get }
}
