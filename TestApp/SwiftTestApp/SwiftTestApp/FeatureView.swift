//
//  FeatureView.swift
//  SwiftTestApp
//
//  Created by joker on 12/30/23.
//

import SwiftUI
import Debug

struct FeatureView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let featurePage = FeatureDemoPage()
        
        return featurePage
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

#Preview {
    FeatureView()
}
