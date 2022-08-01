//
//  HeroSection.swift
//  netflix_clone_swiftui
//
//  Created by Dilshan Harendra Perera on 2022-07-29.
//

import SwiftUI

struct HeroSection: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top, spacing: 0 ){
            ForEach(1...6, id: \.self){ image in
                Image("product4")
                    .resizable()
                    .scaledToFill()
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
    }
}

struct HeroSection_Previews: PreviewProvider {
    static var previews: some View {
        HeroSection()
    }
}
