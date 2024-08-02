//
//  FloatingSheetHome.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 2/8/24.
//

import SwiftUI

struct FloatingSheetHome: View {
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Show Sheet") {
                    showSheet.toggle()
                }
            }
        }
        .floatingBottomSheet(isPresented: $showSheet) {
            SheetView(title: "Replace Existing Folder?",
                      content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      image: .init(content: "questionmark.folder.fill", tint: .blue, foreground: .white),
                      button1: .init(content: "Replace", tint: .blue, foreground: .white),
                      button2: .init(content: "Cancel", tint: Color.primary.opacity(0.08), foreground: Color.primary))
            .presentationDetents([.height(330)])
            .presentationBackgroundInteraction(.enabled(upThrough: .height(330)))
            
            /*Text("Hello World")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.background.shadow(.drop(radius: 5)), in: .rect(cornerRadius: 25))
                .padding(.horizontal, 15)
                .padding(.top, 15)
                .presentationDetents([.height(100), .height(330), .fraction(0.999)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(330)))*/
        }
    }
}

struct SheetView: View {
    var title: String
    var content: String
    var image: FloatingSheetConfig
    var button1: FloatingSheetConfig
    var button2: FloatingSheetConfig?
    
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: image.content)
                .font(.title)
                .foregroundStyle(image.foreground)
                .frame(width: 65, height: 65)
                .background(image.tint.gradient, in: .circle)
            
            Text(title)
                .font(.title3.bold())
            
            Text(content)
                .font(.callout)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .foregroundStyle(.gray)
            
            ButtonView(button1)
            
            if let button2 {
                ButtonView(button2)
            }
        }
        .padding([.horizontal, .bottom], 15)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
                .padding(.top, 30)
        }
        .shadow(color: .black.opacity(0.12), radius: 8)
        .padding(.horizontal, 15)
    }
    
    @ViewBuilder
    func ButtonView(_ config: FloatingSheetConfig) -> some View {
        Button {
            
        } label: {
            Text(config.content)
                .fontWeight(.bold)
                .foregroundStyle(config.foreground)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(config.tint.gradient, in: .rect(cornerRadius: 10))
        }
    }
    
    struct FloatingSheetConfig {
        var content: String
        var tint: Color
        var foreground: Color
    }
}

#Preview {
    FloatingSheetHome()
}
