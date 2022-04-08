//
//  MoviesView.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI

struct TVShowsView: View {
    @State private var isPresented = false
    @State var displayTVShow: TVShow?
    #if DEBUG
    @State var tvShows = TVShow.dummyTVShows
    #elseif PROD
    @State var tvShows: [TVShow] = []
    #endif
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
                            ForEach(tvShows, id: \.id) { tvShow in
                                TVShowItemView(tvShow: tvShow)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        displayTVShow = tvShow
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
            .fullScreenCover(item: $displayTVShow, onDismiss: {
                displayTVShow = nil
            }) { tvShow in
                SimilarShowsSlidesView(tvShow: tvShow)
            }
        }
        .background(Color.from(.fleksyBackground))
        .onAppear(perform: {
            loadShows()
        })
    }
    
    private func loadShows() {
        APIServer.shared.getTopRatedTVShows { shows, error in
            guard let shows = shows else { return }
            print("TVV ", shows)
            tvShows = shows
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowsView()
    }
}
