//
//  ContentView.swift
//  SwiftTestApp
//
//  Created by joker on 12/30/23.
//

import SwiftUI
import Debug

struct ContentView: View {
    var body: some View {
        
        NavigationView(content: {
            VStack {
                Image(uiImage: .test1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(Color(uiColor: .test2))
                
                NavigationLink(destination: FeatureView()) {
                    Text("Features")
                }
            }
        })
        .navigationTitle("OrzUIKit")
    }
}

#Preview {
    ContentView()
}
