//
//  MovieService.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import Foundation
enum MovieServiceError: Error {
    case invalidResponse
}

actor MovieService {
    func fetchData <T : Codable>(api :ApiConstructor) async throws -> T {
        
        let url = try DefaultURLBuilder.build(api: api )
        
        let (data ,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse ,
              response.statusCode >= 200 && response.statusCode < 300
        else {
            throw MovieServiceError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
        
    }
}
