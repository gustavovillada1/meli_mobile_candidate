//
//  ResultsView.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

struct ResultsView<ViewModel: SearchViewModel>: View {
    
    // MARK: Attributes
    @StateObject var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var navigation: MobileCandidateAppNavigation
    
    // MARK: Body
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
    
    // MARK: Views
    private var contentView: some View {
        ScrollView {
            VStack(spacing: viewModel.constants.resultViewVerticalSpacing) {
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
                    
                    LazyVStack(spacing: viewModel.constants.resultViewVerticalSpacing) {
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
                
                Spacer()
                footerView
            }
            .padding(viewModel.constants.resultViewContentPadding)
        }
    }
    
    private var resultsHeaderView: some View {
        VStack(alignment: .leading, spacing: viewModel.constants.resultsHeaderViewVerticalSpacing) {
            Text(viewModel.query)
                .font(.title3)
                .fontWeight(.semibold)
            
            Text("\(viewModel.products.count) \(viewModel.localizables.resultsString.lowercased())")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, viewModel.constants.resultViewContentPadding)
        }
    }
    
    private var emptyResultsView: some View {
        VStack { }
    }
    
    private var footerView: some View {
        FooterView()
    }
    
    private var skeletonView: some View {
        LoadingView(message: "\(viewModel.localizables.loadingString)...", subMessage: viewModel.localizables.resultsScreenLoadingSubMessagge)
    }
    
    private var topBarView: some View {
        TopBarCustom(title: viewModel.localizables.resultsString, onBack: {
            presentationMode.wrappedValue.dismiss()
        })
    }
}
