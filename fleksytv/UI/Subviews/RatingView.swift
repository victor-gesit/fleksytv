//
//  RatingView.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI

struct RatingView: View {
    @State var rating: Float
    var body: some View {
        HStack(spacing: 2) {
            Image.from(.star)
                .resizable()
                .frame(width: 16, height: 16)
            Text(String(format:"%.1f", rating))
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

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 8.5)
    }
}
