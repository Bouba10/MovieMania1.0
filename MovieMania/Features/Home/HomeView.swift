//
//  ContentView.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var viewModel = ViewModel()
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                CarousselView()
                    .frame(height: 320)
                
                VStack(alignment: .leading ,spacing: 30){
                    
                    VStack {
                        HStack {
                            Text("Popular")
                                .font(.title3)
                                .foregroundStyle(.mmPurple)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(viewModel.popularMovies){ popularMovie in
                                    NavigationLink(value: popularMovie) {
                                        MovieCard(movie: popularMovie)
                                    }
                                    .navigationDestination(for: Movie.self) { popularMovie in
                                        DetailView(movie: popularMovie)
                                        
                                    }
                                  
                                    
                                    
                                }
                            }
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Heigh Rating")
                                .font(.title3)
                                .foregroundStyle(.mmPurple)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(viewModel.topRatedMovies){ topRatedMovies in
                                    NavigationLink(value: topRatedMovies) {
                                        MovieCard(movie: topRatedMovies)
                                    }
                                    .navigationDestination(for: Movie.self) { topRatedMovies in
                                        DetailView(movie: topRatedMovies)
                                    }
                                    
                                    
                                    
                                }
                            }
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Trend")
                                .font(.title3)
                                .foregroundStyle(.mmPurple)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(viewModel.trendMovies){ trendMovies in
                                    NavigationLink(value: trendMovies) {
                                        MovieCard(movie: trendMovies)
                                    }
                                    .navigationDestination(for: Movie.self) { trendMovies in
                                      //  MovieDetailsView(movie: popularMovie)
                                        Text(trendMovies.title ?? "")
                                    }
                                    
                                    
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .ignoresSafeArea()
        }
        .task {
            await viewModel.loadPopular()
            await viewModel.loadTopRated()
            await viewModel.loadTrend()
        }
        
               
           
           
            
        
        
    }
}

#Preview {
    HomeView()
}
