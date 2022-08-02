//
//  MovieApi.swift
//  netflix_clone_swiftui
//
//  Created by Dilshan Harendra Perera on 2022-08-01.
//

import Foundation

func getAllMoviesAPI(url: String, handler: @escaping ([Movie])->Void){
    
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
            handler([])
        }
    
       
        guard let data = data else { return}
        DispatchQueue.main.async {
            do{
    
               let decodedResponse = try JSONDecoder().decode(apiResponse.self, from: data)
                print(decodedResponse.results)
                handler(decodedResponse.results)
                
            }catch let error{
                print("Error API", error)
            }
        }
            
    }
    dataTask.resume()
}
