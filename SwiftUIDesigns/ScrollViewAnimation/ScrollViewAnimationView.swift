//
//  ScrollViewAnimationView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct ScrollViewAnimationView: View {
    let items: [ItemModel] = [
            .init(name: "Item 1: 🍓"),
            .init(name: "Item 2: 🍇"),
            .init(name: "Item 3: 🍎"),
            .init(name: "Item 4: 🍉"),
            .init(name: "Item 5: 🍑"),
            .init(name: "Item 6: 🍊"),
            .init(name: "Item 7: 🍍"),
            .init(name: "Item 8: 🍌"),
            .init(name: "Item 9: 🍏"),
            .init(name: "Item 10: 🫐"),
            .init(name: "Item 11: 🥭"),
            .init(name: "Item 12: 🍐")
        ]
    
    @State var scrollIdentifier: UUID?

    var body: some View {
            VStack {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(items) { item in
                            HStack {
                                Text(item.name)
                                    .multilineTextAlignment(.center)
                                    .underline()
                                    .font(.system(size: 60))
                                    .bold()
                            }
                            .padding(30)
                            .border(.black)
                            .frame(width: 300, height: 320)
                        }
                    }
                    .scrollTargetLayout()
                }
                .frame(height: 300)
                HStack {
                    Button {
                        withAnimation {
                            scrollIdentifier = items[5].id
                        }
                    } label: {
                        Text("Go to 🍊")
                    }
                    Button {
                        withAnimation {
                            scrollIdentifier = items[7].id
                        }
                    } label: {
                        Text("Go to 🍌")
                    }
                }
                .bold()
                .buttonStyle(.bordered)
                HStack {
                    Button {
                        withAnimation {
                            scrollIdentifier = items[0].id
                        }
                    } label: {
                        Text("Go to First")
                    }
                    Button {
                        withAnimation {
                            scrollIdentifier = items.last!.id
                        }
                    } label: {
                        Text("Go to Last")
                    }
                }
                .bold()
                .buttonStyle(.bordered)
                Spacer()
            }
            .scrollPosition(id: $scrollIdentifier, anchor: .top)
            .onChange(of: scrollIdentifier) { _, newValue in
                let item = items.filter { newValue == $0.id }
                print("New Scroll Identifier Value", item)
            }
            .navigationTitle("Scroll To Position")
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
        }
}

#Preview {
    ScrollViewAnimationView()
}
