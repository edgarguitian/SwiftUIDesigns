//
//  Inspector View.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 12/7/24.
//

import SwiftUI

struct Inspector_View: View {
    let friends = ["Antoine", "Bas", "Curt", "Dave", "Erica"]

    @State private var showInspector = false
    @State private var isShowingInspector = false

    var body: some View {
      VStack {
          List {
              ForEach(friends, id: \.self) { friend in
                  makeCustomerItem(friend)
                      .onTapGesture {
                          showInspector = true
                      }
                        .inspector(isPresented: $showInspector) {
                          CustomerDetailView(friend)
                            .presentationDetents([.height(650), .medium, .large])
                            .presentationBackgroundInteraction(.disabled)
                            .inspectorColumnWidth(min: 300, ideal: 300, max: 400)
                            .toolbar {
                              Spacer()
                              Button {
                                showInspector.toggle()
                              } label: {
                                Label("Toggle Inspector", systemImage: "xmark.circle")
                              }
                            }
                        }
                  
              }

          }
          
          Button("Show Inspector") {
              isShowingInspector.toggle()
          }
          .buttonStyle(.bordered)
          .font(.largeTitle)
          .inspector(isPresented: $isShowingInspector) {
              Text("Inspector View")
                  .inspectorColumnWidth(min: 50, ideal: 150, max: 200)
          }
      }
    }
    
    @ViewBuilder
    func makeCustomerItem(_ friend: String) -> some View {
        VStack {
            Text(friend)
                .font(.callout.bold())
            
            Text("Data")
            Spacer()
        }
    }
    
    @ViewBuilder
    func CustomerDetailView(_ friend: String) -> some View {
        VStack {
            Text(friend)
                .font(.callout.bold())
            
            Text("Data 1")
            
            Text("Data 2")
        }
    }
}

#Preview {
    Inspector_View()
}
