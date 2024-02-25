//
//  DetailView.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import SwiftUI

enum DetailViewSection : String {
    case about , cast ,review
    
    var rawValue: String {
        switch self {
        case .about:
            return "About Movie"
        case .review:
            return "Reviews"
        case .cast:
            return "Cast"
        }
    }
}


struct DetailView: View {
    @State private var viewModel : ViewModel
    @Environment(\.dismiss) var dismiss
    @Namespace var namespace
    
    init(movie :Movie){
        _viewModel = State(initialValue: ViewModel(movie: movie))
    }
    
    var body: some View {
        VStack(alignment : .leading) {
            header
            
            VStack{
                HStack {
                    ForEach(viewModel.movieDetails?.genres ?? [Genre(id: 1, name: "Action")]){genre in
                        Text(genre.name)
                        if genre.name != viewModel.movieDetails?.genres.last?.name{
                            Text("|")
                        }
                       
                    }
                    
          
                        
                }
                .padding()
                
                HStack{
                    Image(systemName: "calendar")
                    Text( viewModel.movieDetails?.releaseDate.prefix(4) ?? "2000")
                    Text("|")
                    
                    Image(systemName: "clock")
                    Text("\(Int((viewModel.movieDetails?.runtime ?? 1) / 60))h \(String(format: "%02d", (viewModel.movieDetails?.runtime ?? 0)  % 60))m")
                  
                    
                   
                    
                    
                }
                .frame(maxWidth: .infinity)
                
                HStack{
                    ForEach(viewModel.sections ,id :\.self){ section in
                     
                            DetailSectionCard(section: section, namespace: namespace, selectedSection: $viewModel.selectedSection)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    viewModel.selectedSection = section
                                }
                            }
                        
                    }
                }.padding()
                    
                    switch viewModel.selectedSection {
                    case .about:
                        Text(viewModel.movie.overview ?? "")
                    case .cast:
                        Text("cast and Profil")
                        ScrollView(.horizontal ,showsIndicators: false) {
                            LazyHStack{
                                ForEach(viewModel.profiles){ profile in
                                        CastView(cast: profile)
                                }
                                .padding(.bottom , 5)
                            }
                        }
                    case .review:
                        
                        ScrollView {
                           LazyVStack{
                                ForEach(viewModel.reviews){ review in
                                        ReviewCard(review: review)
                                }
                            }
                        }
                    }
                
            }
            .padding()
            .padding(.top , contentOffset)
            
//            Text(viewModel.movieDetails?.overview ?? "pas de titre")
            Spacer()
        }
        .task {
            await viewModel.fetchMovieDetail()
            await viewModel.fecthReviews()
            await viewModel.fecthCredit()
            await viewModel.fecthProfiles()
        }
        .toolbar(.hidden, for: .tabBar)
    }
    
    var posterImageHeight : CGFloat {
        screenHeight * 0.35
    }
    
    var backdropImageSize : CGFloat {
        screenHeight * 0.22
    }
    
    var backdropImageOffset : CGFloat {
        screenHeight * 0.15
    }
    
    var titleOffset : CGFloat {
        screenHeight * 0.15
    }
    
    var contentOffset : CGFloat {
        viewModel.selectedSection == .review ? screenHeight * 0.0 : screenHeight * 0.03
    }
}

#Preview {
    DetailView(movie: .preview)
}


private extension DetailView {
    var header : some View {
        ZStack(alignment: .leading) {
            CustomImageView(itemWidth: screenWidth, itemHeight: posterImageHeight, movie: viewModel.movie, imageType: .poster)
            
            
            
            HStack{
                CustomImageView(itemWidth: backdropImageSize, itemHeight: backdropImageSize, movie: viewModel.movie, imageType : .backdrop)
                
               
                Text(viewModel.movie.title ?? "")
                    .minimumScaleFactor(0.5)
                    .padding(.top ,titleOffset)
            }
            .padding()
            .offset(y: backdropImageOffset )
        }
        .ignoresSafeArea()
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                //
                Image(systemName: "chevron.left")
//                    .foregroundStyle(.mmViolet)
                    .imageScale(.large)
                    .fontWeight(.bold)
                    .background{
                        Circle()
                            .fill(.white.opacity(0.5))
                            .frame(width: 32 , height: 32)
                    }
                    .padding(.horizontal ,10)
            }
            .padding(.leading)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}
