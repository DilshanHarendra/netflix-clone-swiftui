//
//  MovieData.swift
//  netflix_clone_swiftui
//
//  Created by Dilshan Harendra Perera on 2022-07-29.
//

import Foundation

class MovieData: ObservableObject{
    
    private let api_key: String = "19f84e11932abbc79e6d83f82d6d1045"
    
    @Published var movies:[Movie] = []
    
    @Published var movieCategories: [MovieCatrgory] = []
    
    
    init(){
        self.movieCategories = [
            MovieCatrgory(name: "Originals", url: "/discover/tv?api_key=\(self.api_key)&with_networks=213"),
            MovieCatrgory(name: "Trending", url: "/trending/all/week?api_key=\(self.api_key)&language=en-US"),
            MovieCatrgory(name: "Top Rated", url: "/movie/top_rated?api_key=\(self.api_key)&&language=en-US"),
//            MovieCatrgory(name: "Action", url: "/discover/movie?api_key=\(self.api_key)&with_genres=28"),
//            MovieCatrgory(name: "Comedy", url: "/discover/movie?api_key=\(self.api_key)&with_genres=35"),
//            MovieCatrgory(name: "Horror", url: "/discover/movie?api_key=\(self.api_key)&with_genres=27"),
//            MovieCatrgory(name: "Romance", url: "/discover/movie?api_key=\(self.api_key)&with_genres=10749"),
//            MovieCatrgory(name: "Documentry", url: "/discover/movie?api_key=\(self.api_key)&with_genres=99")
       ]
    }
    
    func getMovies(category: MovieCatrgory){
        
        if (category.movies.count == 0){
            getAllMoviesAPI(url: category.url){ movies in
                let categories: [MovieCatrgory] = self.movieCategories.map{(c: MovieCatrgory)-> MovieCatrgory in
                    if (c.name == category.name){
                        var newCategory = c
                        newCategory.movies = movies
                        return newCategory
                        
                    }else{
                        return c
                    }
                    
                }
                self.movieCategories = categories
               
                }
      }
    }
    
    

    
}
