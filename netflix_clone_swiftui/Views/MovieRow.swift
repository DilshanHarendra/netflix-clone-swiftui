//
//  MovieRow.swift
//  netflix_clone_swiftui
//
//  Created by Dilshan Harendra Perera on 2022-07-29.
//

import SwiftUI

struct MovieRow: View {
    
  
    @EnvironmentObject var movieData: MovieData
    var movieCategory: MovieCatrgory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            
            Text("\(movieCategory.name)   \(movieCategory.movies.count)")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0 ){
                    ForEach(movieCategory.movies, id: \.self){ movie in
                        VStack{
                            AsyncImage(url: URL(string: movie.getImage())) { image in
                                    image.resizable().scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 155, height: 155)
                                .padding(5)
                               
                                .cornerRadius(5)
                        } .padding(.trailing, 10)
                       
                           
                    }
                }
            }
            
            
        }.frame(height: 180)
            .padding(.bottom, 50)
          .onAppear{
              movieData.getMovies(category: movieCategory)
        }
            
    }
}

struct MovieRow_Previews: PreviewProvider {
    
    static var movieData = MovieData()
    
    static var movieCategory:[MovieCatrgory] =  movieData.movieCategories
    
    static var previews: some View {
        MovieRow(movieCategory: movieCategory[1])
            .environmentObject(movieData)
    }
}
