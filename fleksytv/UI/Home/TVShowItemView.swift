//
//  MovieItemView.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI

struct TVShowItemView: View {
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626"), content: { image in
                    image
                        .resizable()
                        .frame(width: 72, height: 96)
                        .cornerRadius(8)
                }, placeholder: {
                    ProgressView()
                })
                    .frame(width: 72, height: 96)
                VStack(alignment: .leading) {
                    Text("The Walking Dead")
                        .padding(.top, 8)
                    Text("Drama")
                    Spacer()
                    HStack {
                        yearView("2022")
                        ratingView("8.5")
                    }
                    .padding(.bottom, 8)
                }
                Spacer()
            }
            .frame(height: 100)
            .padding(10)
            .background(.red)
            .cornerRadius(15)
            .listRowBackground(Color.green)
        }
    }
    
    func yearView(_ year: String) -> some View {
        return Text(year)
            .padding(4)
            .padding(.leading, 6)
            .padding(.trailing, 6)
            .background(.gray)
            .cornerRadius(8)
    }
    
    func ratingView(_ rating: String) -> some View {
        return HStack(spacing: 2) {
            Image.from(.star)
                .resizable()
                .frame(width: 16, height: 16)
            Text(rating)
        }
        .padding(4)
        .padding(.leading, 6)
        .padding(.trailing, 6)
        .background(.gray)
        .cornerRadius(8)
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowItemView()
    }
}
