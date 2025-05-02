//
//  SearchView.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

struct SearchView<ViewModel: SearchViewModelProtocol>: View {
    
    // MARK: Properties
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var navigation: MobileCandidateAppNavigation
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.meliYellow.ignoresSafeArea()
            VStack {
                Spacer(minLength: 50)
                contentView
                Spacer()
                footerView
            }
            .padding(.bottom, 20) // Espacio inferior para el footer
            NavigationLink(
                destination: ResultViewWireframe.getResultView(viewModel: viewModel as! SearchViewModel),
                isActive: $navigation.isResultsViewActive,
                label: {}
            )
        }
        .onAppear {
            viewModel.cleanProducts()
        }
    }
    
    // MARK: - Content View
    
    private var contentView: some View {
        VStack(spacing: 15) {
            Text(viewModel.localizables.searchScreenHelloString)
                .fontWeight(.semibold) // Más profesional que .bold
                .font(.system(size: 28)) // Tamaño más grande
                .foregroundColor(.meliBlue) // Color azul de Mercado Libre
                .padding(.top, 20) // Espacio superior
            
            Text(viewModel.localizables.searchScreenHelloSubtitleString)
                .font(.system(size: 18)) // Tamaño más legible
                .foregroundColor(.gray) // Color gris suave
            
            SearchBarCustom(
                text: $viewModel.query,
                hintText: viewModel.localizables.searchScreenTextFieldHintString,
                onSearch: {
                    navigation.isResultsViewActive = true
                    viewModel.onSearch()
                }
            )
            .padding(.horizontal, 20) // Padding para el SearchBar
        }
        .frame(maxWidth: .infinity) // Ancho máximo
        .background(Color.white)
        .padding(10) // Padding interior
        .background(Color.white)
        .cornerRadius(16) // Bordes redondeados
        .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4) // Sombra
        .padding(.horizontal, 24) // Padding horizontal
    }
    
    // MARK: - Footer View
    
    private var footerView: some View {
        VStack {
            HStack {
                Icons().mercadoLibreLogo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 50) // Tamaño más pequeño
                
                Text(viewModel.localizables.technicalTest)
                    .font(.system(size: 12)) // Tamaño más pequeño
                    .foregroundColor(.gray) // Color gris
            }
        }
    }
}

