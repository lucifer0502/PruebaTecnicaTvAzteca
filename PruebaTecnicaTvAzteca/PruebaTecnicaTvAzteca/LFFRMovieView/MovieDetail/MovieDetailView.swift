//
//  MovieDetailView.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 19/02/26.
//

import SwiftUI

struct MovieDetailView: View {
    
    // MARK: - Environment Objects
    @EnvironmentObject var navigationManager: NavigationManger
    
    // MARK: - State Objects
    @StateObject private var viewModel: MovieDetailViewModel
     
    // MARK: - Initializer
     init() {
         _viewModel = StateObject(wrappedValue: MovieDetailViewModel())
     }
    
    // MARK: - Body
    var body: some View {
        ZStack {
          content
            .navigationTitle(navigationManager.selectedMovie?.title ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $viewModel.showTrailer) {
                TrailerView(movieKey: viewModel.movieKey)
                    .presentationBackground(.clear)
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

// MARK: - Private Views
extension MovieDetailView{
    
    private var content: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                posterImage
                titleAndStats
                overviewText
                trailerButton
                Spacer()
            }
            .padding()
        }
    }
    
    @ViewBuilder
    private var posterImage: some View {
        if let posterPath = navigationManager.selectedMovie?.posterPath,
           !posterPath.isEmpty {
            AsyncImageView(url: Constant.urlImage + posterPath)
                .scaledToFit()
                .frame(width: 200, height: 300)
                .cornerRadius(15)
                .clipped()
        }
    }
    
    private var titleAndStats: some View {
        VStack(spacing: 5) {
            Text(navigationManager.selectedMovie?.title ?? "")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
            
            HStack {
                Text("Popularidad: \(String(format: "%.1f", navigationManager.selectedMovie?.popularity ?? 0))")
                    .foregroundColor(.secondary)
                Spacer()
                Text("Votos: \(navigationManager.selectedMovie?.voteCount ?? 0)")
                    .foregroundColor(.secondary)
            }
            
            Text("Fecha: \(navigationManager.selectedMovie?.releaseDate ?? "")")
                .foregroundColor(.secondary)
        }
    }
    
    private var overviewText: some View {
        Text(navigationManager.selectedMovie?.overview?.isEmpty == false
             ? navigationManager.selectedMovie!.overview!
             : "Sin descripción")
            .foregroundColor(.secondary)
            .padding(.top, 10)
            .multilineTextAlignment(.leading)
    }
    
    private var trailerButton: some View {
        Button {
            if let id = navigationManager.selectedMovie?.id {
                viewModel.fetchVideos(movieId: id)
            }
        } label: {
            Label("Ver Trailer", systemImage: "play.circle.fill")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .cornerRadius(12)
        }
    }
}
