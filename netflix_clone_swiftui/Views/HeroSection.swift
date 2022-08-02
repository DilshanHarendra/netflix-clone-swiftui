//
//  HeroSection.swift
//  netflix_clone_swiftui
//
//  Created by Dilshan Harendra Perera on 2022-07-29.
//

import SwiftUI

struct HeroSection: View {
    
    @EnvironmentObject var movieData: MovieData
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top, spacing: 0 ){
                ForEach(movieData.movieCategories[1].movies, id: \.self){ movie in
               
                    AsyncImage(url: URL(string: movie.getImage())) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(
                               width: UIScreen.main.bounds.width,
                               height: 350,
                               alignment: .topLeading)
                        .clipped()
                        .aspectRatio(contentMode: .fill)
                        .listRowInsets(EdgeInsets())
                        .padding(.trailing,5)
            }
            }
        }.padding(.bottom,50)
            .ignoresSafeArea()
            .onAppear(){
                movieData.getMovies(category: movieData.movieCategories[1])
            }
    }
}

struct HeroSection_Previews: PreviewProvider {
    static var movieData = MovieData()
    static var previews: some View {
        HeroSection()
            .environmentObject(movieData)
    }
}
