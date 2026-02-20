//
//  CardGeneric.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 17/02/26.
//

import SwiftUI

// MARK: - CardGeneric
struct CardGeneric: View {
    
    // MARK: - Properties
    let imageUrls: String?
    let title: String
    let voteAverage: Double
    let overview: String?
    let cardConfiguration: CardConfigurationProtocol
    
    // MARK: - Body
    var body: some View {
       content
    }
    
    // MARK: - Private Views
    private var content: some View {
        VStack(alignment: .leading, spacing: 8) {
            imageSection
            titleSection
            overviewSection
            ratingSection
        }
        .frame(width: cardConfiguration.width)
        
    }
    private var imageSection: some View {
        ZStack {
            if let firstUrl = imageUrls {
                AsyncImageView(url: firstUrl)
                    .frame(width: cardConfiguration.width, height: cardConfiguration.height)
            } else {
                Color(red: 3/255, green: 3/255, blue: 31/255)
                    .aspectRatio(cardConfiguration.aspectRatio, contentMode: .fit)
                    .frame(width: cardConfiguration.width, height: cardConfiguration.height)
            }
        }
        .frame(width: cardConfiguration.width, height: cardConfiguration.height)
        .cornerRadius(cardConfiguration.cornerRadius)
        .clipped()
        .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 4)
    }
    
    private var titleSection: some View {
        Text(title)
            .font(.caption)
            .lineLimit(1)
            .frame(width: cardConfiguration.width, alignment: .leading)
    }
    
    private var overviewSection: some View {
        Text(overview ?? "")
            .font(.caption2)
            .foregroundColor(.secondary)
            .lineLimit(2)
            .frame(width: cardConfiguration.width, alignment: .leading)
    }
    
    private var ratingSection: some View {
        Text("Rating: \(String(format: "%.1f", voteAverage))")
            .font(.caption2)
            .foregroundColor(.secondary)
    }
}
