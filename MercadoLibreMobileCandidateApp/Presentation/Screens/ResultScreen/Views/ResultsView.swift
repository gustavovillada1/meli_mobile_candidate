//
//  ResultsView.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

struct ResultsView<ViewModel: SearchViewModel>: View {
    @StateObject var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var navigation: MobileCandidateAppNavigation
    
    var body: some View {
        ZStack() {
            VStack {
                topBarView
                Spacer()
                if viewModel.shouldShowSkeleton {
                    skeletonView
                } else {
                    contentView
                }
                Spacer()
            }
            NavigationLink(
                destination: ProductDetailViewWireframe.getProductDetailView(with: viewModel.productIdSelected),
                isActive: $navigation.isProductDetailViewActive,
                label: {}
            )
        }
    }
    
    private var footerView: some View {
        VStack {
            HStack {
                Icons().mercadoLibreLogo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 40)
                Text(viewModel.localizables.technicalTest)
                    .font(.caption)
            }
        }
    }
    
    private var skeletonView: some View {
        VStack(spacing: 16) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                .scaleEffect(1.5)
            
            Text("\(viewModel.localizables.loadingString)...")
                .font(.headline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground).opacity(0.8))
        .edgesIgnoringSafeArea(.all)
    }
    
    private var contentView: some View {
        ScrollView {
            VStack(spacing: 16) {
                if let error: AppError = viewModel.errorType {
                    ErrorView(
                        error: error,
                        didTapOnRetry: viewModel.onSearch,
                        didTapOnCallJson: viewModel.didTapOnGetJson
                    )
                }
                
                if viewModel.products.isEmpty {
                    emptyResultsView
                } else {
                    resultsHeaderView
                    
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.products, id: \.id) { product in
                            ListTileCustom(product.title)
                                .subtitle(ProductDetailAttributesHelper.getConditionString(product.condition))
                                .price(product.price.toCurrencyFormat())
                                .imageUrl(product.thumbnail ?? String())
                                .onTap {
                                    navigation.isProductDetailViewActive = true
                                    viewModel.didTapOnElement(for: product.id)
                                }
                            
                        }
                    }
                }
                
                Spacer(minLength: 20)
                footerView
            }
            .padding(10)
        }
    }
    
    private var resultsHeaderView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(viewModel.query)
                .font(.title3)
                .fontWeight(.semibold)
            
            Text("\(viewModel.products.count) \(viewModel.localizables.resultsString.lowercased())")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
        }
    }
    
    private var emptyResultsView: some View {
        VStack { }
    }
    
    private var topBarView: some View {
        TopBarCustom(title: viewModel.localizables.resultsString, onBack: {
            presentationMode.wrappedValue.dismiss()
        })
    }
}
