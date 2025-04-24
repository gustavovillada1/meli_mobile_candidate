//
//  MobileCandidateRepositoryDataMapper.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

class MobileCandidateRepositoryDataMapper {
    
    func mapProductDetailData(_ dto: MobileCandidateProductDTO) -> MobileCandidateProductDomainModel {
        return MobileCandidateProductDomainModel()
    }
    
    func mapProductsResultData(_ dto: MobileCandidateProductResultsDTO) -> MobileCandidateResultsDomainModel {
        return MobileCandidateResultsDomainModel()
    }
}
