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
        MovieCatrgory(name: "Action", url: "/discover/movie?api_key=\(self.api_key)&with_genres=28"),
        MovieCatrgory(name: "Comedy", url: "/discover/movie?api_key=\(self.api_key)&with_genres=35"),
        MovieCatrgory(name: "Horror", url: "/discover/movie?api_key=\(self.api_key)&with_genres=27"),
        MovieCatrgory(name: "Romance", url: "/discover/movie?api_key=\(self.api_key)&with_genres=10749"),
        MovieCatrgory(name: "Documentry", url: "/discover/movie?api_key=\(self.api_key)&with_genres=99")
        ]
    }
    
    
    func getMovies(url: String){
        
        struct apiResponse: Decodable{
            var page: Int
            var results: [Movie]
            var total_results: Int
            var total_pages: Int
        }
        
        guard let url = URL(string: "https://api.themoviedb.org/3\(url)")else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask  = URLSession.shared.dataTask(with: urlRequest){(data, response, error) in
            
            if let error = error {
                print("Get Movie Error", error)
                return
            }
        
           
            guard let data = data else { return}
            DispatchQueue.main.async {
                do{
        
                   let decodedResponse = try JSONDecoder().decode(apiResponse.self, from: data)
                    print(decodedResponse.results)
                    self.movies = decodedResponse.results
                    
                }catch let error{
                    print("Error", error)
                }
            }
                
        }
        dataTask.resume()
    }
    
}
