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
                contentView
            }

        }

    }
    
    private var contentView: some View {
        ScrollView {
            VStack(spacing: 16) {
                if let imageUrl = viewModel.dependencies.product.imageUrl , let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .cornerRadius(12)
                            .shadow(radius: 4)
                    } placeholder: {
                        ProgressView()
                            .frame(height: 250)
                    }
                }
                
                Text(viewModel.dependencies.product.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text(viewModel.dependencies.product.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                HStack(spacing: 8) {
                    ForEach(0..<5) { i in
                        Image(systemName: i < Int(viewModel.dependencies.product.rating) ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                    }
                    Text("(\(viewModel.dependencies.product.rating))")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Text(viewModel.dependencies.product.price.toCurrencyFormat())
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Spacer()
            }
            .padding()
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

