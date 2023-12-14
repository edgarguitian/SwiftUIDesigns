//
//  AsyncImageView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct AsyncImageView: View {
    let thumbnailImageURL: URL = .init(string: "https://images.unsplash.com/photo-1500817487388-039e623edc21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1978&q=80")!
    
    var body: some View {
        AsyncImage(url: thumbnailImageURL) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
        } placeholder: {
            VStack {
                ProgressView()
                Text("Loading...")
            }
        }
    }
}

#Preview {
    AsyncImageView()
}
