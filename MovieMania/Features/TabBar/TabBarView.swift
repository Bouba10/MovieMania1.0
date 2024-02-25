//
//  TabBarView.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 14.02.24.
//

import SwiftUI

struct TabBarView: View {
   
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("", systemImage: "house")
                }
            SearchView()
                .tabItem {
                    Label("", systemImage: "magnifyingglass")
                }
//            Text("Favoris")
//                .tabItem {
//                    Label("", systemImage: "star")
//                }
            ProfileView()
                .tabItem {
                    Label("", systemImage: "person")
                }
        }
    }
}

#Preview {
    TabBarView()
}
