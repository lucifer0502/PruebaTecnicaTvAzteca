//
//  AsyncImage.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 17/02/26.
//

import SwiftUI

struct AsyncImageView: View {
    
    // MARK: - Properties
    let url: String
    
    // MARK: - Body
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
            } else if phase.error != nil {
                Image("imagenError")
                    .resizable()
                    .scaledToFit()
            } else {
                LoadingView()
            }
        }
    }
}
