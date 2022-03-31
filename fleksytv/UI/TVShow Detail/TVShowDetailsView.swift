//
//  TVShowDetailsView.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI
import CachedAsyncImage

struct TVShowDetailsView: View {
    @State var tvShow: TVShow
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .center) {
                ZStack {
                    CachedAsyncImage(url: tvShow.posterPath.safelyUnwrapped.imageURLWith(.w45), content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .blur(radius: 20)
                    }, placeholder: {ProgressView()})
                        .frame(minHeight: 300)
                    CachedAsyncImage(url: tvShow.posterPath.safelyUnwrapped.imageURLWith(.original), content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                    }, placeholder: {
                        ProgressView()
                            .frame(alignment: .center)
                            .tint(.white)
                    })
                        .frame(minHeight: 300)
                }
            }
            .frame(maxWidth: 300, maxHeight: 300)
            .background(Color.from(.fleksyBackground))
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
            Text(tvShow.name.safelyUnwrapped)
                .font(Font.custom(from: .axiformaSemibold, size: 16))
                .foregroundColor(Color.from(.fleksyWhite))
                .padding(.top, 10)
                .padding(.bottom, 10)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tvShow.genres, id: \.self) { genre in
                        PaddedText(text: genre)
                    }
                }
            }
            Divider()
            HStack {
                PaddedText(text: tvShow.firstAirDate.safelyUnwrapped.yearFromDateString)
                RatingView(rating: tvShow.voteAverage ?? 0)
            }
            ScrollView {
                VStack(alignment: .leading) {
                    Text(tvShow.overview.safelyUnwrapped)
                        .font(Font.custom(from: .axiformaRegular, size: 12))
                        .foregroundColor(Color.from(.fleksyWhite))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(nil)
                }.frame(maxWidth: .infinity)
                    .padding(15)
            }
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
        TVShowDetailsView(tvShow: .dummyTVShow)
    }
}
