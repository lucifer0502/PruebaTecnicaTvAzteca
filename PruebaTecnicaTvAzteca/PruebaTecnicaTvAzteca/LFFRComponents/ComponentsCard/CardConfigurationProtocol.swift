//
//  CardConfiguration.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 18/02/26.
//

import Foundation

// MARK: - CardConfigurationProtocol
protocol CardConfigurationProtocol {
    
    // MARK: - Layout Properties
    var width: CGFloat { get }
    var height: CGFloat { get }
    var aspectRatio: CGFloat { get }
    var cornerRadius: CGFloat { get }
}
