//
//  MovieItemView.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI

struct MovieItemView: View {
    var body: some View {
        HStack {
            Image.from(.testImageCover)
                .resizable()
                .frame(width: 72, height: 96)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text("The Walking Dead")
                    .padding(.top, 8)
                Text("Drama")
                Spacer()
                HStack {
                    yearView
                    ratingView
                }
                .padding(.bottom, 8)
            }
            Spacer()
        }
        .padding()
        .background(.red)
        .cornerRadius(15)
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 100)
    }
    
    var yearView: some View {
        return Text("2020")
            .padding(4)
            .padding(.leading, 6)
            .padding(.trailing, 6)
            .background(.gray)
            .cornerRadius(8)
    }
    
    var ratingView: some View {
        return HStack(spacing: 2) {
            Image.from(.star)
                .resizable()
                .frame(width: 16, height: 16)
            Text("8.5")
        }
        .padding(4)
        .padding(.leading, 6)
        .padding(.trailing, 6)
        .background(.gray)
        .cornerRadius(8)
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView()
    }
}
