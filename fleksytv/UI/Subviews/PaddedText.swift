//
//  PaddedText.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI

struct PaddedText: View {
    @State var text: String
    var body: some View {
        Text(text)
            .font(Font.custom(from: .axiformaRegular, size: 12))
            .foregroundColor(Color.from(.fleksyWhite))
            .padding(4)
            .padding(.leading, 6)
            .padding(.trailing, 6)
            .frame(height: 24)
            .background(Color.from(.fleksyLightGray))
            .cornerRadius(8)
    }
}

struct PaddedText_Previews: PreviewProvider {
    static var previews: some View {
        PaddedText(text: "Hello")
    }
}
