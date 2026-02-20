//
//  TrailerView.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 19/02/26.
//

import SwiftUI
import SafariServices

struct TrailerView: View {
    
    // MARK: - Properties
    let movieKey: String?
    
    // MARK: - Body
    var body: some View {
        content
    }
    
    // MARK: - Private Views
    @ViewBuilder
    private var content: some View {
        if let movieKey = movieKey,
        let url = URL(string: "https://www.youtube.com/watch?v=\(movieKey)") {
            SafariViewRepresentable(url: url)
                .ignoresSafeArea()
        } else {
            contentUnavailableView
        }
    }
    
    private var contentUnavailableView: some View {
        ZStack {
            Color(red: 3/255, green: 3/255, blue: 31/255)
                 .ignoresSafeArea()
             VStack(spacing: 10) {
                 Image("aztecatv")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 120, height: 120)
                 
                 Text("Sin trailer disponible, seguimos trabajando")
                     .font(.title2)
                     .foregroundColor(.white)
                     .bold()
             }
         }
    }
}
