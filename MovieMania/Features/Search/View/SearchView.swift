//
//  SearchView.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 14.02.24.
//

import SwiftUI

struct SearchView: View {
    
    @State  private var viewModel = ViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            if searchText .isEmpty {
                
                Text("No results")
//                ForEach(viewModel.trendMovies){movie in
//                    Text(movie.title)
//                }
            }

            else {
                ScrollView{
                    LazyVStack{
                        ForEach(viewModel.searchResult){ movie in
                            NavigationLink(value: movie) {
                                SearchCard(movie: movie)
                            }
                            .navigationDestination(for: Movie.self) { movie in
                                DetailView(movie: movie)
                            }
                           
                        }
                    }
                }
                .navigationTitle("Searchable Example")
            }
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) {  newValue in
            if newValue.count > 2 {
                Task{
//                    await viewModel.loadSearch(query: newValue)
                    await viewModel.search(term: newValue)
                }
            }
               
        } .task{
            await viewModel.loadTrend()
        }
    }
}

#Preview {
    SearchView()
}
