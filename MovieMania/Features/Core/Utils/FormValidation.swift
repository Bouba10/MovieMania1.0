//
//  FormValidation.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 20.02.24.
//

import Foundation

protocol AuthenticationFormProtocol {
    var formIsValid : Bool {get}
}


extension AuthenticationFormProtocol {
    func isValidEmail(_ email: String) -> Bool {
            let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.caseInsensitive])
            return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.utf16.count)) != nil
        }
}

