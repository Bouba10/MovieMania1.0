//
//  SearchCard.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 14.02.24.
//

import SwiftUI

struct SearchCard: View {
    let movie : Movie
    var body: some View {
        HStack{
            
            CustomImageView(itemWidth: 80, itemHeight: 120, movie: movie, imageType: .poster)
            VStack(alignment:.leading, spacing :10){
                Text(movie.title ?? "")
                    .font(.headline)
                  
                
                HStack{
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundStyle(.yellow)
                    Text("\(movie.voteAverage ,specifier: "%.1f")")
                        .foregroundStyle(.yellow)
                    
                }
                .fontWeight(.heavy)
            }
            Spacer()
        }
        .background(Color(red:61/255 , green: 61/255 ,blue: 88/255))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    SearchCard(movie: .preview)
}
