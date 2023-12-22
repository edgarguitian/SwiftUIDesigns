//
//  ContentExpandableView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 22/12/23.
//

import SwiftUI

struct ContentExpandableView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ExpandableView(thumbnail: ThumbnailView(content: {
                        VStack {
                            Text("Ejemplo titulo fila a expandir")
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundStyle(.white)
                                .font(.title2)
                            
                            Text("Ejemplo descripcion fila a expandir")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                        }
                        .padding()
                    }), expanded: ExpandedView(content: {
                        VStack {
                            Text("Ejemplo titulo fila a expandir")
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundStyle(.white)
                                .font(.title2)
                            
                            Text("Ejemplo descripcion fila a expandir")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                            Text("Lorem ipsum dolor sit amet consectetur adipiscing elit magnis cubilia habitant, facilisis facilisi sed pharetra urna ultricies natoque netus convallis, penatibus lectus at potenti tempor nisi donec dictumst metus. Dignissim eleifend vitae lacus duis porta rutrum habitant nec auctor, sodales libero nisl curae mus ornare elementum arcu. Mattis etiam accumsan integer tempus volutpat orci velit aptent, condimentum proin viverra laoreet habitasse urna habitant, mollis montes hac fames sociis sem odio.")
                                .foregroundStyle(.white)
                        }.padding()
                        Spacer()
                    }))
                }
                .padding()
            }
            .scrollIndicators(.never)
        }
    }
}

#Preview {
    ContentExpandableView()
}
