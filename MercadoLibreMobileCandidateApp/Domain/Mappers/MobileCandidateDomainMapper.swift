//
//  MobileCandidateDomainMapper.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

struct MobileCandidateDomainMapper {
    func mapResult(_ domain: MobileCandidateResultsDomainModel) -> [MobileCandidateProductModel] {
        return []
    }
    
    func mapProductDetail(_ domainModel: MobileCandidateProductDomainModel) -> MobileCandidateProductModel {
        return MobileCandidateProductModel()
    }
}
