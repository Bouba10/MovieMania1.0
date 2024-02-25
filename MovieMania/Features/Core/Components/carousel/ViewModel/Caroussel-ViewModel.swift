//
//  Caroussel-ViewModel.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import Foundation
import Observation

extension CarousselView {
    @Observable
    class ViewModel {
        private (set) var  nowPlayingMovies : [Movie] = []
        
       private  let movieService = MovieService()
        
        func loadNowPlaying() async {
            do{
                let movieResponse : MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .upcoming))
                
                nowPlayingMovies = movieResponse.results
            }catch{
                print("error")
            }
        }
    }
}
