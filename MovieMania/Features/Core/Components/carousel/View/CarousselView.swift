//
//  CarousselView.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import SwiftUI

struct CarousselView: View {
    let movie : Movie = .preview
    let type : MovieCardType = .grid
    
   
    @State private var viewModel = ViewModel()
    
    var body: some View {
        TabView (){

            ForEach(viewModel.nowPlayingMovies){ movie in
                ZStack (alignment : .topLeading){
                    AsyncImage(url: URL(string: movie.getImage(for: .poster))) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            
                    } placeholder: {
                        
    
                            VStack{
                                ProgressView()
                                Text(movie.title ?? "")
                            }
                        
                         
                }
                    VStack(alignment : .leading){
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text("\(movie.voteAverage ,specifier: "%.1f")")
                        }
                        .padding()
                        .background(.mmBlack2.opacity(0.8) )
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                        Text(movie.title ?? "")
                            .font(.title)
                            .fontWeight(.heavy)
                        
//                        HStack{
//                            Text("Action  |  Adventure |  Fantasy")
//                                .font(.footnote)
//                                .padding()
//                                .background(.mmBlack2 )
//                                .clipShape(RoundedRectangle(cornerRadius: 25))
//                            Spacer()
//                           
//                        }
                        
                    }
                    .padding(.top ,300)
                    .padding()
                    .foregroundStyle(.white)
                }
                
            }
            
        }
        
        .tabViewStyle(.page)
        .task {
            await viewModel.loadNowPlaying()
        }
       
        
    }
    
    var posterImageHeight : CGFloat {
        screenWidth * 1
    }
    
    var backdropImageSize : CGFloat {
        screenHeight * 0.40
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
    CarousselView()
}
