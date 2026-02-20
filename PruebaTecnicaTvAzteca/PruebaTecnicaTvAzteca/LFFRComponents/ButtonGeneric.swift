//
//  ButtonGeneric.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 17/02/26.
//

import SwiftUI

// MARK: - ButtonGeneric
struct ButtonGeneric: View {
    
    // MARK: - Properties
    let label: String
    let icon: String
    var isSelected: Bool = false
    let action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            content
        }
    }
    
    // MARK: - Private Views
    private var content: some View {
        VStack {
            Image(systemName: icon)
            Text(label)
                .font(.caption)
        }
        .foregroundColor(isSelected ? .green : .gray)
    }
}
