//
//  MovieItemView.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI
import CachedAsyncImage

struct TVShowItemView: View {
    @State var tvShow: TVShow
    var body: some View {
        VStack {
            HStack {
                CachedAsyncImage(url: tvShow.posterPath.safelyUnwrapped.imageURLWith(.original), content: { image in
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
                    Text(tvShow.name.safelyUnwrapped)
                        .font(Font.custom(from: .axiformaSemibold, size: 16))
                        .foregroundColor(Color.from(.fleksyWhite))
                        .padding(.top, 8)
                        .padding(.bottom, 0.5)
                    Text(tvShow.genres.joined(separator: ", "))
                        .font(Font.custom(from: .axiformaRegular, size: 12))
                        .foregroundColor(Color.from(.fleksyLightFont))
                    Spacer()
                    HStack {
                        yearView(tvShow.firstAirDate.safelyUnwrapped.yearFromDateString)
                        ratingView("\(tvShow.voteAverage ?? 0)")
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

#if DEBUG
struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowItemView(tvShow: TVShow.dummyTVShow)
    }
}
#endif
