//
//  StringExtension.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation

extension String {
    var appLocalizables: String {
        NSLocalizedString(
            self,
            tableName: "localizables",
            bundle: Bundle.module,
            value: String(),
            comment: self)
    }
}
