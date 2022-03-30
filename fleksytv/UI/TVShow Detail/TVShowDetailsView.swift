//
//  TVShowDetailsView.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI

struct TVShowDetailsView: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    var genres = ["Action", "Comedy", "Sci-Fi", "Action1", "Comedy2", "Sci-Fi3"]
    var body: some View {
        VStack(alignment: .leading) {
            Image.from(.testImageCover)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minHeight: 300)
                .cornerRadius(10)
                .clipped()
            Text("Halo")
                .font(Font.custom(from: .axiformaSemibold, size: 16))
                .foregroundColor(Color.from(.fleksyWhite))
                .padding(.top, 10)
                .padding(.bottom, 10)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(genres, id: \.self) { genre in
                        PaddedText(text: genre)
                    }
                }
            }
            Divider()
            HStack {
                PaddedText(text: "2022")
                RatingView(rating: "2.9")
            }
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Hello from the other side")
                        .font(Font.custom(from: .axiformaRegular, size: 12))
                        .foregroundColor(Color.from(.fleksyWhite))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(nil)
                }.frame(maxWidth: .infinity)
                    .padding(15)
            }.frame(maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
                .background(Color.from(.fleksyDarkTextBackground))
            .cornerRadius(18)
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(20)
        .background(Color.from(.fleksyGray))
        .cornerRadius(30)
        .padding()
    }
}

struct TVShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailsView()
    }
}
