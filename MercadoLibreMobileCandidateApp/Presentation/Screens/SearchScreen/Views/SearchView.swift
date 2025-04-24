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
    
    var body: some View {
        ZStack {
            VStack {
                Spacer(minLength: 50)
                contentView
                Spacer()
                footerView
            }
            .background(Color.yellow) // Establece el color de fondo del ZStack
            .ignoresSafeArea()
            NavigationLink(
                destination: ResultViewWireframe.getResultView(viewModel: viewModel as! SearchViewModel),
                isActive: $navigation.isResultsViewActive,
                label: {}
            )
        }

    }
    
    private var contentView: some View {
        VStack {
            Text("Hola,")
                .fontWeight(.bold)
                .font(.title)
            Text("¿Qué deseas buscar hoy?")
            SearchBarCustom(
                text: $viewModel.query,
                hintText: "¿Quizá un celular, ropa?",
                onSearch: {
                    navigation.isResultsViewActive = true
                    viewModel.onSearch()
                }
            )
        }
        .background(Color.white)
        .padding(20) // Padding interior
        .background(Color.white)
        .cornerRadius(16) // Bordes redondeados
        .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4) // Sombra
        .padding(.horizontal, 16)
    }
    
    private var footerView: some View {
        VStack {
            HStack {
                Icons().mercadoLibreLogo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                Text("Prueba técnica")
                    .font(.caption)
            }
        }
    }
}
/*
#Preview {
    SearchView()
}*/
