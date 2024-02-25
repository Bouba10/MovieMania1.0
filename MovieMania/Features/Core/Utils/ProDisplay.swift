//
//  ProDisplay.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import Foundation

enum ProDisplay : String {
    case bold ,medium , regular , semiBold
    
    var fontName : String {
        "SF-Pro-Display-\(self.rawValue.capitalized)"  //  SF-Pro-Display-Bold
    }
}
