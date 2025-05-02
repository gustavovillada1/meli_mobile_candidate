//
//  ProductDetailView.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

struct ProductDetailView<ViewModel: ProductDetailViewModelProtocol>: View {
    
    @StateObject var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var navigation: MobileCandidateAppNavigation
    
    var body: some View {
        ZStack {
            VStack {
                topBarView
                if viewModel.shouldShowLoader {
                    skeletonView
                } else {
                    contentView
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
    
    private var footerView: some View {
        VStack {
            HStack {
                Image("mercado-libre-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                Text("Prueba técnica")
                    .font(.caption)
            }
        }
    }
    
    private var skeletonView: some View {
        VStack(spacing: 16) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                .scaleEffect(1.5)

            Text("Buscando...")
                .font(.headline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground).opacity(0.8))
        .edgesIgnoringSafeArea(.all)
    }
    
    private var contentView: some View {
        ScrollView {
            if let error: AppError = viewModel.appError {
                ErrorView(
                    error: error,
                    didTapOnRetry: viewModel.getProductDetailsAPI,
                    didTapOnCallJson: viewModel.didTapOnGetJson
                )
            }
            if let productDetail = viewModel.productDetail  {
                VStack(spacing: 16) {
                    
                    HStack {
                        Text(ProductDetailAttributesHelper.getConditionString(productDetail.condition) + " | ")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        Text(ProductDetailAttributesHelper.getSoldQuantityString(productDetail.soldQuantity))
                            .font(.caption)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .padding(.horizontal)

                    if let imageUrl = productDetail.thumbnail , let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                                .frame(height: 250)
                        }
                    }
                    
                    Text(productDetail.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    
                    Text(productDetail.price.toCurrencyFormat(productDetail.currencyID))
                        .foregroundStyle(Color.green)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    
                    Text("Características del producto")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.top, 40)
                    ForEach(productDetail.attributes, id: \.id) { productAttribute in
                        ListTileCustom(productAttribute.name)
                            .subtitle(productAttribute.valueName)
                    
                    }
                    
                    Spacer()
                    footerView
                }
                .padding()
            } else {
                EmptyView()
            }
        }
    }
    
    private var topBarView: some View {
        TopBarCustom(
            title: "Detalles",
            onBack: {
                presentationMode.wrappedValue.dismiss()
            },
            trailingAction: {
                navigation.isProductDetailViewActive = false
                navigation.isResultsViewActive = false
            }
        )
    }
}

