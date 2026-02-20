//
//  PruebaTecnicaTvAztecaApp.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 17/02/26.
//

import SwiftUI

@main
struct PruebaTecnicaTvAztecaApp: App {
    
    // MARK: - State
    @State private var showSplash = true
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            ZStack {
                if !showSplash {
                    MovieView()
                        .transition(.opacity)
                }
                
                if showSplash {
                    SplashView(isActive: $showSplash)
                        .transition(.opacity)
                        .zIndex(1)
                }
            }
        }
    }
}

