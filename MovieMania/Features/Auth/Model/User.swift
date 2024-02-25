//
//  User.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 20.02.24.
//

import Foundation
struct User : Identifiable , Codable {
    let id  : String
    let userName: String
    let email : String
    
    var initials : String {
        let formatter = PersonNameComponentsFormatter()
        
        if let components = formatter.personNameComponents(from: userName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
    
    
}

extension User {
    static var  MOCK_USER = User(id: NSUUID().uuidString, userName: "Bouba Barry", email: "test@example.com")
}
