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
    
    @Namespace private var animation
    @State private var showPosterFullScreen = false

     
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
            }
            if viewModel.isLoading {
                LoadingView()
            }
            if showPosterFullScreen {
                fullScreenPoster
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
                posterButton
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
                .matchedGeometryEffect(id: "poster", in: animation)
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                        showPosterFullScreen = true
                    }
                }
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
    
    @ViewBuilder
    private var fullScreenPoster: some View {
        if let posterPath = navigationManager.selectedMovie?.posterPath {
            ZStack(alignment: .topTrailing) {
                
                Color.black.opacity(0.9)
                    .ignoresSafeArea()
                    .onTapGesture {
                        closePoster()
                    }
                
                AsyncImageView(url: Constant.urlImage + posterPath)
                    .scaledToFit()
                    .matchedGeometryEffect(id: "poster", in: animation)
                    .padding()
                
                Button {
                    closePoster()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .transition(.opacity)
        }
    }

    private func closePoster() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
            showPosterFullScreen = false
        }
    }

    
    private var posterButton: some View {
        Button {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                showPosterFullScreen = true
            }
        } label: {
            Label("Ver Poster", systemImage: "photo")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(12)
        }
    }

}
