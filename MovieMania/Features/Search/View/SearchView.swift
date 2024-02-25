//
//  SearchView.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 14.02.24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

       var body: some View {
           NavigationStack {
               Text("Searching for \(searchText)")
                   .navigationTitle("Searchable Example")
           }
           .searchable(text: $searchText)    
    }
}

#Preview {
    SearchView()
}
