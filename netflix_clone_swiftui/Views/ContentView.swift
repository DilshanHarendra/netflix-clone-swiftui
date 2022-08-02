//
//  ContentView.swift
//  netflix_clone_swiftui
//
//  Created by Dilshan Harendra Perera on 2022-07-29.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var movieData: MovieData
    var body: some View {
        
        ScrollView{
            VStack{
                // hero
                HeroSection()
                //movi categories
                ForEach(movieData.movieCategories, id: \.self){ category in
                    
                    MovieRow(movieCategory: category)
                }
                
            
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
   
    
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(MovieData())
        }
    }
}
