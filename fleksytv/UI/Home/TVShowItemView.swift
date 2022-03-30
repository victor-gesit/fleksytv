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
                        .tint(.white)
                })
                    .frame(width: 72, height: 96)
                VStack(alignment: .leading) {
                    Text("The Walking Dead")
                        .font(Font.custom(from: .axiformaSemibold, size: 16))
                        .foregroundColor(Color.from(.fleksyWhite))
                        .padding(.top, 8)
                        .padding(.bottom, 0.5)
                    Text("Drama, Adventure, Sci-Fi")
                        .font(Font.custom(from: .axiformaRegular, size: 12))
                        .foregroundColor(Color.from(.fleksyLightFont))
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
            .background(Color.from(.fleksyGray))
            .cornerRadius(15)
        }
    }
    
    func yearView(_ year: String) -> some View {
        return Text(year)
            .font(Font.custom(from: .axiformaMedium, size: 12))
            .foregroundColor(Color.from(.fleksyWhite))
            .padding(4)
            .padding(.leading, 6)
            .padding(.trailing, 6)
            .frame(height: 24)
            .background(Color.from(.fleksyLightGray))
            .cornerRadius(8)
    }
    
    func ratingView(_ rating: String) -> some View {
        return HStack(spacing: 2) {
            Image.from(.star)
                .resizable()
                .frame(width: 16, height: 16)
            Text(rating)
                .font(Font.custom(from: .axiformaMedium, size: 12))
                .foregroundColor(Color.from(.fleksyWhite))
        }
        .padding(4)
        .padding(.leading, 6)
        .padding(.trailing, 6)
        .frame(height: 24)
        .background(Color.from(.fleksyLightGray))
        .cornerRadius(8)
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowItemView()
    }
}
