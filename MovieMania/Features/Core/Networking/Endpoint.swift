//
//  Endpoint.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import Foundation


enum Endpoint  {
    case trending ,topRated , poupular , upcoming , nowPlaying , credit(_ movieId : Int) , movieDetail(_ movieId : Int) , movieReviews(_ movieId :Int) , profile(_ memberId: Int) , search (_ query :String)
    
    var path : String {
        switch self {
        case .trending:
            return "/3/trending/movie/week"
        case .topRated:
            return "/3/movie/top_rated"
        case .poupular:
            return "/3/movie/popular"
        case .upcoming:
            return "/3/movie/upcoming"
        case .nowPlaying:
            return "/3/movie/now_playing"
        case .credit(let movieId):
            return "/3/movie/\(movieId)/credits"
        case .movieDetail(let movieId):
            return  "/3/movie/\(movieId)"
        case .movieReviews(let movieId):
            return "/3/movie/\(movieId)/reviews"
        case .profile(let memberId):
            return "/3/person/\(memberId)"
        case .search(let query):
            return "/3/search/movie"
        }
    }
    
    var fullPath : String {
        Constants.apiBaseUrl + path
    }
    
}
