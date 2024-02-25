//
//  Review.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import Foundation


// MARK: - Welcome
struct ReviewResponse: Codable {
    let id, page: Int
    let results: [Review]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Review: Codable ,Identifiable {
    let author: String
    let authorDetails: AuthorDetails?
    let content, createdAt, id, updatedAt: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
    }
}

// MARK: - AuthorDetails
struct AuthorDetails: Codable {
    let name, username: String
    let avatarPath: String?
    let rating: Int?

    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}


extension Review {
    var authorName :String {
        authorDetails?.authorName ?? author
    }
    
    var authorImage : String {
        var image = authorDetails?.avatarPath ?? ""
       
        
        if image.starts(with: "/"){
            image = String(image.dropFirst())
            
        }
        
        return  "https://secure.gravatar.com/avatar/" + image
    }
    
    static var mocReview : Review {
        return  Review(author: "Test Author", authorDetails: nil, content: "test content", createdAt: "2024", id: "test", updatedAt: "test", url: "https://secure.gravatar.com/avatar/04d45e186650672a416315dac947b3d6.jpg")
    }
}

extension AuthorDetails {
    var authorName : String {
        name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? username : name
    }
}
