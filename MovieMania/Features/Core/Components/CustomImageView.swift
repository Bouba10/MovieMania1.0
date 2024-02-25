//
//  CustomImageView.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import SwiftUI

struct CustomImageView: View {
    let itemWidth : CGFloat
    let itemHeight : CGFloat
    
    let movie : Movie
    var imageType : MovieImageType = .poster
    
    var body: some View {
        AsyncImage(url: URL(string: movie.getImage(for: imageType))) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ZStack {
                Color.mmGray
                VStack{
                    ProgressView()
                    Text(movie.title ?? "")
                }
            }
        }
        .frame(width: itemWidth, height: itemHeight)
        .clipShape(RoundedRectangle(cornerRadius: 20))

    }
}

#Preview {
    CustomImageView(itemWidth: 150, itemHeight: 200, movie: .preview)
}
