//
//  Detail-ViewModel.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import Foundation
import Observation

extension DetailView {
    @Observable
    class ViewModel {
        let movie : Movie
        
        private let movieService = MovieService()
        private (set) var movieDetails : MovieDetail?
        private (set) var reviews : [Review] = []
        
        private (set) var credits : Credit?
        private (set) var cast : [Cast] = []
        private (set) var profiles : [CastProfile] = []
        
        let sections : [DetailViewSection] = [.about , .cast , .review]
        var selectedSection : DetailViewSection = .about
        
        init(movie: Movie) {
            self.movie = movie
        }
        
        func fecthCredit() async {
            do {
                let response : Credit = try await movieService.fetchData(api: ApiConstructor(endpoint: .credit(movie.id)))
                credits = response
                cast = credits!.cast
            } catch  {
                print(error)
            }
        }
        
        func fecthProfiles() async {
            do{
                for member in cast {
                    let response : CastProfile = try await movieService.fetchData(api: ApiConstructor(endpoint: .profile(member.id)))
                    profiles.append(response)
                }
                
            }catch {
                print(error.localizedDescription)
            }
        }
        
        func fetchMovieDetail() async {
            do{
                let response : MovieDetail = try await movieService.fetchData(api: ApiConstructor(endpoint: .movieDetail(movie.id)))
                movieDetails = response
            }catch{
                print(error)
            }
        }
        
        func fecthReviews() async {
            do {
                let response : ReviewResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .movieReviews(movie.id)))
                reviews = response.results
                
            } catch  {
                print(error)
            }
        }
    }
}
