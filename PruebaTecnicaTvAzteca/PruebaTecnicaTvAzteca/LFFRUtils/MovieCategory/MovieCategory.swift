//
//  MovieCategory.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 18/02/26.
//

// MARK: - MovieCategory
enum MovieCategory: String, CaseIterable, Identifiable {
    
    // MARK: - Identifiable
    var id: String {self.rawValue}
    
    // MARK: - Cases
    case nowplaying = "now_playing"
    case popular = "popular"
    case upcoming = "upcoming"
    case topRated = "top_rated"
    
    // MARK: - Title
    var title: String {
        switch self {
        case .nowplaying: return "Cartelera"
        case .popular: return "Populares"
        case .upcoming: return "Próximamente"
        case .topRated: return "Mejor Valoradas"
        }
    }
    
    // MARK: - Icon Name
    var iconName: String {
        switch self {
        case .nowplaying: return "film.fill"
        case .popular: return "star.fill"
        case .upcoming: return "clock.fill"
        case .topRated: return "star.circle.fill"
        }
    }
    
    // MARK: - Card Configuration
    var cardConfiguration: CardConfigurationProtocol {
        switch self {
        case .nowplaying: return PosterCardConfiguration()
        case .popular:    return ThumbnailCardConfiguration()
        case .upcoming:   return PosterCardConfiguration()
        case .topRated:   return ThumbnailCardConfiguration()
            
        }
    }
}
