//
//  ThumbnailCardConfiguration.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 18/02/26.
//

import Foundation

// MARK: - ThumbnailCardConfiguration
struct ThumbnailCardConfiguration: CardConfigurationProtocol {
    
    // MARK: - Layout Properties
    let width: CGFloat = 185
    let height: CGFloat = 105
    let aspectRatio: CGFloat = 16/9
    let cornerRadius: CGFloat = 15
}
