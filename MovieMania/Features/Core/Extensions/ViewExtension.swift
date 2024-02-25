//
//  ViewExtension.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import SwiftUI

extension View {
    func sfprodisplay(_ font : ProDisplay , size :CGFloat = 14.0) -> some View{
        self
            .font(.custom(font.fontName, size: size))
    }
    
    
    // pemet d'ajuster la taille de nos composant  en fonction de la taille et position de l'ecarn
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
}


/* use case
 
  Text("Hello")
    .sfprodisplay(.bold ,20)

 */
