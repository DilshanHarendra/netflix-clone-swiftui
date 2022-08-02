//
//  Movie.swift
//  netflix_clone_swiftui
//
//  Created by Dilshan Harendra Perera on 2022-07-29.
//

import Foundation

struct Movie: Decodable, Identifiable, Hashable, Encodable {
    var id: Int
    var backdrop_path: String
    var first_air_date: String?
    var genre_ids: [Int]?
    var name: String?
    var origin_country: [String]?
    var original_language: String?
    var original_name: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String
 //   var formated_image: String
    
    
    func getImage()-> String{
        let path:String = self.poster_path == "" ? self.poster_path : self.backdrop_path
        
    
        return "https://image.tmdb.org/t/p/original\(path)"
    }

    
}
