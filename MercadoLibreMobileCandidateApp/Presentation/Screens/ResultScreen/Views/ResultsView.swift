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
                footerView
            }
            NavigationLink(
                destination: ProductDetailViewWireframe.getProductDetailView(with: viewModel.productSelected),
                isActive: $navigation.isProductDetailViewActive,
                label: {}
            )
        }
        /*
        .alert("Something went wrong", isPresented: $viewModel.shouldShowAlert) {
                    Button("OK", role: .cancel) { }
                    Button("Retry") {
                        print("Retrying...")
                    }
                } message: {
                    Text("Please try again later.")
                }*/
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
        VStack {
            if viewModel.products.isEmpty {
                emptyResultsView
            } else  {
                ForEach(viewModel.products, id: \.id) { product in
                    ListTileCustom(product.name)
                        .subtitle(product.description)
                        .price(product.price.toCurrencyFormat())
                        .rating(product.rating)
                        .imageUrl(product.imageUrl ?? "")
                        .onTap {
                            navigation.isProductDetailViewActive = true
                            viewModel.didTapOnElement(for: product)
                        }
                
                }
            }
            Spacer()
        }
        .padding(20)
    }
    
    private var emptyResultsView: some View {
        VStack {
            
        }
    }
    
    private var topBarView: some View {
        TopBarCustom(title: "Resultados", onBack: {
            presentationMode.wrappedValue.dismiss()
        })
    }
}

/*
#Preview {
    ResultsView()
}
*/
