//
//  DomainMapper.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

struct DomainMapper {

    func mapResult(_ domainModel: [ProductItemDomainModel]) -> [ProductItemModel] {
        return domainModel.map { productDomainModel in
            ProductItemModel(
                id: productDomainModel.id,
                title: productDomainModel.title, 
                price: productDomainModel.price,
                currencyID: productDomainModel.currencyID,
                availableQuantity: productDomainModel.availableQuantity,
                soldQuantity: productDomainModel.soldQuantity,
                condition: productDomainModel.condition,
                permalink: productDomainModel.permalink,
                thumbnail: productDomainModel.thumbnail
            )
        }
    }
    
    func mapProductDetail(_ domain: ProductDetailDomainModel) -> ProductDetailModel {
        return ProductDetailModel(
            id: domain.id,
            title: domain.title,
            price: domain.price,
            currencyID: domain.currencyID,
            availableQuantity: domain.availableQuantity,
            soldQuantity: domain.soldQuantity,
            condition: domain.condition,
            permalink: domain.permalink,
            thumbnail: domain.thumbnail,
            pictures: mapProductDetailPictures(from: domain.pictures),
            warranty: domain.warranty,
            attributes: mapProductDetailAttributes(from: domain.attributes)
        )
    }
    
    private func mapProductDetailPictures(from picturesDomain: [ProductDetailPictureDomainModel]) -> [ProductDetailPictureModel] {
        return picturesDomain.map { productDetailPictureDomain in
            ProductDetailPictureModel(id: productDetailPictureDomain.id, url: productDetailPictureDomain.url)
        }
    }
    
    private func mapProductDetailAttributes(from attributesDomain: [ProductDetailAttributeDomainModel]) -> [ProductDetailAttributeModel] {
        return attributesDomain.map { productDetailAttributeDomain in
            ProductDetailAttributeModel(
                id: productDetailAttributeDomain.id,
                name: productDetailAttributeDomain.name,
                valueName: productDetailAttributeDomain.valueName
            )
        }
    }
    
}
