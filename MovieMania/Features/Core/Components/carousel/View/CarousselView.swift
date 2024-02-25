//
//  CarousselView.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import SwiftUI

struct CarousselView: View {
  let movie : Movie
  let type : MovieCardType = .grid
    
    let imageList  : [MovieImageType] = [.poster , .backdrop]
    
    var body: some View {
        TabView {
            ForEach(imageList ,id : \.self){  imgl in
                CustomImageView(itemWidth: itemWidth, itemHeight: itemHeight, movie: movie, imageType: imgl)

            }
                   }
    }
}


extension  CarousselView {
    var itemWidth : CGFloat {
        screenWidth * type.widthPercent
    }
    
    var itemHeight : CGFloat {
        screenWidth * type.heightPercent
    }
}
#Preview {
    CarousselView(movie: .preview)
}
