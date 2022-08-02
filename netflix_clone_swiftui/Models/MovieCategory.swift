//
//  MovieCategory.swift
//  netflix_clone_swiftui
//
//  Created by Dilshan Harendra Perera on 2022-08-01.
//

import Foundation

struct MovieCatrgory: Encodable, Hashable{
    var name: String
    var url: String
    var movies: [Movie]

    init(name: String, url: String){
        self.name = name
        self.url = url
        self.movies = []
    }
}
