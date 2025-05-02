//
//  AppLocalizables.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation

struct AppLocalizables: AppLocalizablesProtocol {
    
    // MARK: Common Strings
    var resultsString: String { "results_string".appLocalizables}
    var newString: String { "new_string".appLocalizables }
    var usedString: String { "used_String".appLocalizables }
    var technicalTest: String { "technical_test".appLocalizables }
    var loadingString: String { "loading_string".appLocalizables }
    
    // MARK: Search Screen Strings
    var searchScreenHelloString: String { "search_screen_hello_string".appLocalizables }
    var searchScreenHelloSubtitleString: String { "search_screen_hello_subtitle_string".appLocalizables }
    var searchScreenTextFieldHintString: String { "search_screen_textfield_hint_string".appLocalizables }
    
    // MARK: Results Screen Strings
    var resultsScreenLoadingSubMessagge: String { "results_screen_loading_sub_messagge".appLocalizables }
    
    // MARK: Product Detail Screen Strings
    var productDetailScreenSoldQuantitySubfixString: String { "product_detail_screen_sold_quantity_subfix_string".appLocalizables }
    var productDetailScreenProductAttributesTitle: String { "product_detail_screen_product_attributes_title".appLocalizables }
    
}
