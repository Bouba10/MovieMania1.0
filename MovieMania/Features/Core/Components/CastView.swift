//
//  CastView.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 14.02.24.
//

import SwiftUI

struct CastView: View {
    let cast : CastProfile
    var body: some View {
        VStack {
            AsyncImage(url: cast.photoUrl) { image in
                      image
                          .resizable()
                          .scaledToFill()
                          .frame(width: 100, height: 120)
                          .clipShape(RoundedRectangle(cornerRadius: 15))
                  } placeholder: {
                      ProgressView()
                          .frame(width: 100, height: 120)
                  }
                  Text(cast.name)
                      .lineLimit(1)
                      .frame(width: 100)
              }
    }
}

//#Preview {
//    CastView()
//}
