//
//  SimilarShowsSlidesView.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI

struct SimilarShowsSlidesView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image.from(.close)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .padding(.trailing, 20)
                    .padding(10)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            }
            TabView {
                ForEach(0..<30) { i in
                    TVShowDetailsView()
                }
            }
            .tabViewStyle(.page)
        }
    }
}

struct SimilarShowsSlidesView_Previews: PreviewProvider {
    static var previews: some View {
        SimilarShowsSlidesView()
    }
}
