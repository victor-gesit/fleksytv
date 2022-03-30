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
    var body: some View {
        VStack(alignment: .leading) {
            Image.from(.testImageCover)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 400)
                .cornerRadius(10)
                .clipped()
            Text("Halo")
            HStack {
                paddedText("Action")
                paddedText("Comedy")
                paddedText("Sci-Fi")
            }
            HStack {
                paddedText("2022")
                ratingView("2.9")
            }
            VStack {
                TextEditor(text: .constant("Hello from the other side"))
                    .foregroundColor(.green)
                    .padding(2)
            }
            .background(.blue)
            .cornerRadius(18)
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(20)
        .background(.red)
        .cornerRadius(30)
        .padding()
    }
    
    func paddedText(_ text: String) -> some View {
        return Text(text)
            .padding(4)
            .padding(.leading, 6)
            .padding(.trailing, 6)
            .background(.gray)
            .cornerRadius(8)
    }
    
    func ratingView(_ rating: String) -> some View {
        return HStack(spacing: 2) {
            Image.from(.star)
                .resizable()
                .frame(width: 16, height: 16)
            Text(rating)
        }
        .padding(4)
        .padding(.leading, 6)
        .padding(.trailing, 6)
        .background(.gray)
        .cornerRadius(8)
    }
}

struct TVShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailsView()
    }
}
