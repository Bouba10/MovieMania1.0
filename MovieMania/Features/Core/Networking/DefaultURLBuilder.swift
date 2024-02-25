//
//  DefaultURLBuilder.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import Foundation

enum DefaultURLBuilderError : Error {
    case invalidPath , invalidURL
}

enum DefaultURLBuilder {
    
    static func buildQueryParameters(_ params : Parameters...) -> [URLQueryItem] {
        params.flatMap{$0}.map{URLQueryItem(name:$0.key , value: $0.value)}
    }
    
   static func build(api :ApiConstructor) throws -> URL {
       guard var urlComponents = URLComponents(string: api.endpoint.fullPath) else { throw DefaultURLBuilderError.invalidPath}
       
       urlComponents.queryItems = buildQueryParameters(api.params , ["api_key" : Constants.apiKey])
       
       guard let url = urlComponents.url else { throw DefaultURLBuilderError.invalidURL }
       
       return url
        
    }
    
    
}
