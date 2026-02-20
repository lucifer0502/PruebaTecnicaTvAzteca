//
//  SafariView.swift
//  PruebaTecnicaTvAzteca
//
//  Created by T7 dimension on 19/02/26.
//

import SwiftUI
import SafariServices

struct SafariViewRepresentable: UIViewControllerRepresentable {
    
    // MARK: - Properties
    let url: URL
    
    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> SFSafariViewController { SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ vc: SFSafariViewController, context: Context) {}
}
