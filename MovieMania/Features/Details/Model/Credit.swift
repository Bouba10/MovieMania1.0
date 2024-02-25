//
//  Credit.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 14.02.24.
//

import Foundation

// MARK: - Credit
struct Credit: Codable {
    let id: Int
    let cast, crew: [Cast]
}

// MARK: - Cast
struct Cast: Codable {
    let adult: Bool
    let gender, id: Int
    
    let name, originalName: String
    let popularity: Double
    let profilePath: String?
    let castID: Int?
    let character: String?
    let creditID: String
    let order: Int?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
      
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order,  job
    }
}


//return viewModel.selectedSection == .review ? screenHeight * 0.01 : 
struct CastProfile: Codable, Identifiable {

    let birthday: String?
    let id: Int
    let name: String
    let profile_path: String?

    var photoUrl: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w200")
        return baseURL?.appending(path: profile_path ?? "")
    }
}
