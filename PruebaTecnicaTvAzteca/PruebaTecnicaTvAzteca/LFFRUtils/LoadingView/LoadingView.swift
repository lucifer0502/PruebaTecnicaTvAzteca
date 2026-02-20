//
//  LoadingView.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 17/02/26.
//

import SwiftUI

struct LoadingView: View {
    
    // MARK: - State
    @State private var rotationAngle: Double = 0.0
    @State private var timer = Timer.publish(every: 0.014, on: .main, in: .common).autoconnect()
    
    // MARK: - Body
    var body: some View {
        content
    }
    
    // MARK: - Private Methods
    private var content: some View{
        ZStack {
            Color(red: 3/255, green: 3/255, blue: 31/255)
                .opacity(0.5)
                .ignoresSafeArea()
            Image("aztecatv")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .rotationEffect(.degrees(rotationAngle))
                .onReceive(timer) { _ in
                    rotationAngle += 5
                    if rotationAngle >= 360 { rotationAngle = 0 }
                }
        }
    }
}
