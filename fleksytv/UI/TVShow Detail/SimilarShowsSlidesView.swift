//
//  SimilarShowsSlidesView.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI

struct SimilarShowsSlidesView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var tvShow: TVShow
    @State var similarShows: [TVShow] = []
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image.from(.close)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                    .padding(.trailing, 20)
                    .padding(10)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            }
            TabView {
                ForEach(similarShows.isEmpty ? [tvShow] : similarShows) { show in
                    TVShowDetailsView(tvShow: show)
                }
            }
            .tabViewStyle(.page)
            Text("Swipe for similar shows")
                .font(Font.custom(from: .axiformaMedium, size: 12))
                .foregroundColor(Color.from(.fleksyLightFont))
                .padding(.bottom, 6)
                .padding(.top, 2)
        }
        .onAppear(perform: {
            fetchSimilarShows()
        })
        .background(Color.from(.fleksyBackground))
    }
    
    private func fetchSimilarShows() {
        APIServer.shared.getSimilarTVShows(tvId: "\(tvShow.id)") { shows, error in
            guard let shows = shows else { return }
            similarShows = [tvShow] + shows
        }
    }
}

struct SimilarShowsSlidesView_Previews: PreviewProvider {
    static var previews: some View {
        SimilarShowsSlidesView(tvShow: TVShow.dummyTVShow)
    }
}
