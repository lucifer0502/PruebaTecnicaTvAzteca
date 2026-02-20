//
//  Splashview.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 20/02/26.
//

import SwiftUI

struct SplashView: View {
    
    // MARK: - Binding
    @Binding var isActive: Bool
    
    // MARK: - State
    @State private var opacity: Double = 0.0
    @State private var scale: CGFloat = 1.0
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // MARK: Background color #03031F
            Color(red: 3/255, green: 3/255, blue: 31/255)
                .ignoresSafeArea()
            
            // MARK: Splash Image
            Image("aztecatv")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipped()
                .opacity(opacity)
                .scaleEffect(scale)
                .onAppear {
                    
                    withAnimation(.easeIn(duration: 1.2)) {
                        opacity = 1.0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation(.easeOut(duration: 0.5)) {
                            opacity = 0
                            scale = 0.5
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            isActive = false
                        }
                    }
                }
        }
    }
}
