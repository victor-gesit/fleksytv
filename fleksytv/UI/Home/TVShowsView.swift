//
//  MoviesView.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI

struct TVShowsView: View {
    @State private var isPresented = false
    var body: some View {
        ZStack {
            VStack {
                Image.from(.logo)
                HStack {
                    Text("Most Popular TV Shows")
                        .font(Font.custom(from: .axiformaSemibold, size: 22))
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                        .padding(.bottom, 0)
                    Spacer()
                }
                    List {
                        VStack {
                            ForEach(TVShow.testTVShows, id: \.id) { tvShow in
                                TVShowItemView()
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        isPresented = true
                                    }
                            }
                            
                        }
                    }
                    .refreshable{
                        print("Reloading...")
                    }
                    .listStyle(.plain)
            }
            .fullScreenCover(isPresented: $isPresented, content: SimilarShowsSlidesView.init)
        }
        .background(.brown)
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowsView()
    }
}
