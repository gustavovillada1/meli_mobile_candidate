//
//  ProductDetailAttributesHelper.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation

struct ProductDetailAttributesHelper {
    
    public static func getConditionString(_ condition: String) -> String {
        switch condition {
        case "new":
            return "Nuevo"
            
        default:
            return "Reacondicionado"
        }
    }
    
    public static func getSoldQuantityString(_ soldQuantity: Int) -> String {
        if soldQuantity > 100 {
            return "+100 vendidos"
        } else {
            return "\(soldQuantity) vendidos"
        }
    }
}
