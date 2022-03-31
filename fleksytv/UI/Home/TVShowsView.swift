//
//  MoviesView.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI

struct TVShowsView: View {
    @State private var isPresented = false
    @State var showingTVShow: TVShow?
    var body: some View {
        ZStack {
            VStack {
                Image.from(.logo)
                HStack {
                    Text("Most Popular TV Shows")
                        .font(Font.custom(from: .axiformaSemibold, size: 22))
                        .foregroundColor(Color.from(.fleksyWhite))
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                        .padding(.bottom, 0)
                        .padding(.top, 20)
                    Spacer()
                }
                    ScrollView {
                        VStack {
                            ForEach(TVShow.dummyTVShows, id: \.id) { tvShow in
                                TVShowItemView(tvShow: tvShow)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        showingTVShow = tvShow
                                        isPresented = true
                                    }
                            }
                            
                        }
                    }
                    .padding()
                    .refreshable{
                        print("Reloading...")
                    }
                    .listStyle(.plain)
            }
            .fullScreenCover(item: $showingTVShow, onDismiss: {
                showingTVShow = nil
            }) { tvShow in
                SimilarShowsSlidesView(tvShow: tvShow)
            }
        }
        .background(Color.from(.fleksyBackground))
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowsView()
    }
}
