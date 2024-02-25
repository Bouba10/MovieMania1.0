//
//  Home-ViewModel.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import Foundation
import Observation

extension HomeView {
    @Observable
    class ViewModel {
        private (set) var popularMovies : [Movie] = []
        private (set) var topRatedMovies : [Movie] = []
        private (set) var trendMovies : [Movie] = []
        
        private (set) var errorMsg = ""
        
        let movieService = MovieService()
        
        //popular
        func loadPopular() async {
            do{
                let movieResponse  : MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .poupular))
                popularMovies = movieResponse.results
            }catch {
                errorMsg = "Error: \(error)"
            }
        }
        
        // topRated
        func loadTopRated() async {
            do{
                let movieResponse  : MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .topRated))
                topRatedMovies = movieResponse.results
            }catch {
                errorMsg = "Error: \(error)"
            }
        }
        
        
        //trend
        
        func loadTrend() async {
            do{
                let movieResponse  : MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .trending))
                trendMovies = movieResponse.results
            }catch {
                errorMsg = "Error: \(error)"
            }
        }
        
    }
}
