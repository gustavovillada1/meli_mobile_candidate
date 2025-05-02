//
//  RepositoryDataMapper.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

class RepositoryDataMapper {
    
    func mapProductsResultData(_ dto: SearchProductResultsDTO) -> [ProductItemDomainModel] {
        return dto.results.map { product in
            ProductItemDomainModel(
                id: product.id,
                title: product.title, price: product.price, 
                currencyID: product.currencyID,
                availableQuantity: product.availableQuantity, 
                soldQuantity: product.soldQuantity,
                condition: product.condition,
                permalink: product.permalink,
                thumbnail: product.thumbnail
            )
        }
    }
    
    func mapProductDetailData(_ dto: ProductDetailDTO) -> ProductDetailDomainModel {
        return ProductDetailDomainModel(
            id: dto.id,
            title: dto.title,
            price: dto.price,
            currencyID: dto.currencyID,
            availableQuantity: dto.availableQuantity,
            soldQuantity: dto.soldQuantity,
            condition: dto.condition,
            permalink: dto.permalink,
            thumbnail: dto.thumbnail,
            pictures: mapProductDetailPictures(from: dto.pictures),
            warranty: dto.warranty,
            attributes: mapProductDetailAttributes(from: dto.attributes)
        )
    }
    
    private func mapProductDetailPictures(from picturesDTO: [ProductDetailPictureDTO]) -> [ProductDetailPictureDomainModel] {
        return picturesDTO.map { productDetailPictureDTO in
            ProductDetailPictureDomainModel(id: productDetailPictureDTO.id, url: productDetailPictureDTO.url)
        }
    }
    
    private func mapProductDetailAttributes(from attributesDTO: [ProductDetailAttributeDTO]) -> [ProductDetailAttributeDomainModel] {
        return attributesDTO.map { productDetailAttributeDTO in
            ProductDetailAttributeDomainModel(
                id: productDetailAttributeDTO.id,
                name: productDetailAttributeDTO.name,
                valueName: productDetailAttributeDTO.valueName
            )
        }
    }
}
