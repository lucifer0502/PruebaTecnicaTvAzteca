//
//  NavigationManager.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 17/02/26.
//

import SwiftUI
import Foundation

// MARK: - NavigationManager
class NavigationManger: ObservableObject {
    
    // MARK: - Published Properties
    @Published var path: [DestinationEnum] = []
    @Published var selectedMovie: MovieResult? = nil
    
    // MARK: - Navigation Methods
    func navigate(to destination: DestinationEnum) {
        DispatchQueue.main.async {
            self.path.append(destination)
        }
    }
    
    func goBack(levels: Int = 1) {
        DispatchQueue.main.async {
            let countToRemove = min(levels, self.path.count)
            self.path.removeLast(countToRemove)
        }
    }
    
    // MARK: - Destination Views
    @ViewBuilder
    func destination(for destination: DestinationEnum) -> some View {
        switch destination {
        case .detailMovie:
            MovieDetailView()
                .environmentObject(self)
        }
    }
}
