//
//  MovieRow.swift
//  netflix_clone_swiftui
//
//  Created by Dilshan Harendra Perera on 2022-07-29.
//

import SwiftUI

struct MovieRow: View {
    
    var movieCategory: MovieCatrgory
    @EnvironmentObject var movieData: MovieData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            
            Text(movieCategory.name)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0 ){
                    ForEach(movieData.movies, id: \.self){ movie in
                      
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(movie.poster_path)")) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 155, height: 155)
                        .padding(5)
                        .cornerRadius(5)
                           
                    }
                }
            }
            
            
        }.frame(height: 180)
            .padding(.bottom, 50)
          .onAppear{
              movieData.getMovies(url:movieCategory.url)
        }
            
    }
}

struct MovieRow_Previews: PreviewProvider {
    
    static var movieCategory:[MovieCatrgory] =  MovieData().movieCategories
    
    static var previews: some View {
        MovieRow(movieCategory: movieCategory[0]).environmentObject(MovieData())
    }
}
