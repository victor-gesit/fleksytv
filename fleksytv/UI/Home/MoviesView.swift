//
//  MoviesView.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI

struct MoviesView: View {
    var body: some View {
        VStack {
            Image.from(.logo)
            HStack {
                Text("Most Popular TV Shows")
                    .font(Font.title)
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .padding(.bottom, 0)
                Spacer()
            }
                List {
                    VStack {
                        ForEach(TVShow.testTVShows, id: \.id) { tvShow in
                            MovieItemView()
                                .padding(.bottom, 10)
                        }
                    }
                }
                .listStyle(.plain)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Hello")
                    
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
