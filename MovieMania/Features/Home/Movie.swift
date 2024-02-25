//
//  Movie.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Movie
struct Movie: Codable ,Identifiable , Hashable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double
    let posterPath, releaseDate, title: String?
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    
  static  var  preview  : Movie { Movie(adult: false,
                                backdropPath: "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
                                genreIDS: [28 ,30],
                                id: 102,
                                originalLanguage: "",
                                originalTitle: "",
                                overview: "",
                                popularity: 10.0,
                                posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
                                releaseDate: "",
                                title: "The Shawshank Redemption",
                                video: false,
                                voteAverage: 10.0,
                                voteCount: 2)
    }
}



extension  Movie {
  
    func getImage(for type : MovieImageType) -> String {
        switch type {
        case .poster:
            return Constants.imageBaseUrl + (posterPath ?? "")
        case .backdrop:
            return  Constants.imageBaseUrl + (backdropPath ?? "")
        }
    }
}

enum  MovieImageType {
    case poster, backdrop
}

