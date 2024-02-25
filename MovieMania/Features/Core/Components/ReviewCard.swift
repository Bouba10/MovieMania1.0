//
//  ReviewCard.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import SwiftUI

struct ReviewCard: View {
    let review : Review

    var body: some View {
        VStack(alignment: .leading, content: {
       
            HStack {
                AsyncImage(url: URL(string: review.authorImage)) { image in
                    image
                        .resizable()
                } placeholder: {
                    ZStack {
                        Color.mmPurple
                        
                        if let firstchart = review.authorName.first{
                            Text(String(firstchart))
                        }
                    }
                   
                }
                .scaledToFill()
                .frame(width: 45, height: 45)
                .clipShape(Circle())

                
                Text(review.authorName)
            }
            
            Text(review.content)
            
            Divider()
        })
    }
}

#Preview {
    ReviewCard(review: .mocReview)
}
