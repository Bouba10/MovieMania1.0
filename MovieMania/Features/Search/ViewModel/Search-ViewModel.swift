//
//  Search-ViewModel.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 14.02.24.
//

import Foundation
import  Observation

extension  SearchView {
    @Observable
    class ViewModel {
        private (set) var trendMovies : [Movie] = []
        private (set) var searchResult : [Movie] = []
        
        
        private (set) var errorMsg = ""
        
        let movieService = MovieService()
        
        //trend
        
        func loadTrend() async {
            do{
                let movieResponse  : MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .trending))
                trendMovies = movieResponse.results
            }catch {
                errorMsg = "Error: \(error)"
            }
        }
        
        // a revoir
//        func loadSearch( query : String) async {
//            print(query)
//            do{
//                let searchResponse : MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .search(query)))
//                searchResult = searchResponse.results
//                print("dans do \(searchResult.count)")
//                
//            }catch {
//                errorMsg = "Error: \(error.localizedDescription)"
//                print(errorMsg)
//            }
//        }
//        
        func search(term: String) async{
            print("ds search \(term)")
            let url  = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(Constants.apiKey)&include_adult=false&language=en-US&page=1&query=\(term)")!
 
            do{
                let (data,_) = try await URLSession.shared.data(from: url)
                let decodedTrending = try JSONDecoder().decode(MovieResponse.self, from: data)
                
                searchResult = decodedTrending.results
                print("Resuult count : \(searchResult.count)")

            }catch{
                print("error \(error.localizedDescription)")
            }
        }
    }
    
}
