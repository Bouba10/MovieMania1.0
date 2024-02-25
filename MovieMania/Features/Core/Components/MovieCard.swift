//
//  MovieCard.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import SwiftUI

struct MovieCard: View {
    let movie : Movie
    let type : MovieCardType = .poster
    
    var body: some View {
        CustomImageView(itemWidth: itemWidth, itemHeight: itemHeight, movie: movie, imageType: .poster)
    }
}


extension MovieCard {
    var itemWidth : CGFloat {
        screenWidth * type.widthPercent
    }
    
    var itemHeight : CGFloat {
        screenWidth * type.heightPercent
    }
}
#Preview {
    MovieCard(movie: .preview)
}
