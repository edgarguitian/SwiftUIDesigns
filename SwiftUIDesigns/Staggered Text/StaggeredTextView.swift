//
//  StaggeredTextView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct StaggeredTextView: View {
    @State private var isShown: Bool = true
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Spacer()
                Text("Transcribe Videos")
                    .font(Font.largeTitle.bold())
                    .offset(x: 0, y: isShown ? 0 : 75)
                    .opacity(isShown ? 1 : 0)
                    .padding(4)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .animation(Animation.easeOut.delay(isShown ? 0.1 : 0.2))
                
                Text("Share Ideas")
                    .font(Font.largeTitle.bold())
                    .offset(x: 0, y: isShown ? 0 : 75)
                    .opacity(isShown ? 1 : 0)
                    .padding(4)
                    .foregroundColor(.purple)
                    .animation(Animation.easeOut.delay(0.15))
                
                Text("Remix Everything")
                    .font(Font.largeTitle.bold())
                    .offset(x: 0, y: isShown ? 0 : 75)
                    .opacity(isShown ? 1 : 0)
                    .padding(4)
                    .foregroundColor(.red)
                    .animation(Animation.easeOut.delay(isShown ? 0.2 : 0.1))
                
                Spacer()
                Button(action: {
                    isShown.toggle()
                }) {
                    Text(isShown ? "Hide" : "Show")
                }
            }
            Spacer()
        }.padding(16)
    }
}

#Preview {
    StaggeredTextView()
}
