//
//  MovieSectionView.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 18/02/26.
//

import SwiftUI

// MARK: - MovieSectionView
struct MovieSectionView: View {
    
    // MARK: - Properties
    let title: String
    let cardConfiguration: CardConfigurationProtocol
    let movies: [MovieResult]
    let isLoading: Bool
    let navigationManager: NavigationManger
    
    // MARK: - Body
    var body: some View {
        content
    }
    
    // MARK: - Private Views
    private var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            movieScroll
        }
    }
    
    private var header: some View {
        Text(title.uppercased())
            .font(.headline)
            .bold()
            .padding(.horizontal)
    }
    
    private var movieScroll: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                if isLoading {
                    LoadingView()
                        .frame(width: 200, height: 150)
                } else {
                    ForEach(movies, id: \.id) { movie in
                        movieButton(for: movie)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func movieButton(for movie: MovieResult) -> some View {
        Button {
            navigationManager.selectedMovie = movie
            navigationManager.navigate(to: .detailMovie)
        } label: {
            CardGeneric(
                imageUrls: imageUrl(for: movie),
                title: movie.title,
                voteAverage: movie.voteAverage,
                overview: movie.overview,
                cardConfiguration: cardConfiguration,
                
            )
        }
        .buttonStyle(.plain)
    }
    
    // MARK: - Private
    private func imageUrl(for movie: MovieResult) -> String {
        switch cardConfiguration {
        case is ThumbnailCardConfiguration:
            return Constant.urlImageBackdrop + (movie.backdropPath ?? movie.posterPath ?? "")
        default:
            return Constant.urlImage + (movie.posterPath ?? movie.backdropPath ?? "")
        }
    }
}
