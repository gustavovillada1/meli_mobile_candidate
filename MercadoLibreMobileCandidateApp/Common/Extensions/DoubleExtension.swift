//
//  DoubleExtension.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 24/04/25.
//

import Foundation

extension Double {
    func toCurrencyFormat(_ currencyID: String = String()) -> String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "\(currencyID) $ "

        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
