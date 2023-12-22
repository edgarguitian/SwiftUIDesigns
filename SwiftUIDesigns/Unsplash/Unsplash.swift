//
//  Unsplash.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct Unsplash: View {
    @ObservedObject var randomImages = UnsplashData()
       var body: some View {
           NavigationView {
               ScrollView {
                   LazyVStack {
                       ForEach(randomImages.photoArray, id: \.id) { photo in
                           AsyncImage(url: URL(string: photo.urls["regular"]!)) { image in
                               image.resizable()
                                   .aspectRatio(contentMode: .fill)
                           } placeholder: {
                               Color.gray.opacity(0.1)
                           }
                       }
                   }
               }.navigationBarTitle("Unsplash API")
           }
       }
}

#Preview {
    Unsplash()
}
