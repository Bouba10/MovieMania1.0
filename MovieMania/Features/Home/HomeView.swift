//
//  ContentView.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .sfprodisplay(.medium, size: 40)
                .foregroundStyle(.mmGray)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
