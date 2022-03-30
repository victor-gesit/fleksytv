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
                .frame(height: 400)
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
                        paddedText(genre)
                    }
                }
            }
            Divider()
            HStack {
                paddedText("2022")
                ratingView("2.9")
            }
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Hello from the other side")
                        .font(Font.custom(from: .axiformaRegular, size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(nil)
                }.frame(maxWidth: .infinity)
                    .padding(8)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.blue)
            .cornerRadius(18)
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(20)
        .background(Color.from(.fleksyGray))
        .cornerRadius(30)
        .padding()
    }
    
    func paddedText(_ text: String) -> some View {
        return Text(text)
            .font(Font.custom(from: .axiformaRegular, size: 12))
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
                .font(Font.custom(from: .axiformaRegular, size: 12))
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

struct TVShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailsView()
    }
}
