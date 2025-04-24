//
//  ResultViewWireframe.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import SwiftUI

public struct ResultViewWireframe {
    
    @ViewBuilder
    public static func getResultView(viewModel: SearchViewModel) -> some View {
        let resultsView: ResultsView = ResultsView(viewModel: viewModel)
        
        resultsView
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
