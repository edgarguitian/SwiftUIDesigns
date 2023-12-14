//
//  ContentView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 13/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var presentSideMenu = false
    @State var showView: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        NavigationLink(destination: TabBarT()) {
                            ContentViewCell(title: "3D Tab Bar")
                        }
                        Button {
                            showView.toggle()
                        } label: {
                            ContentViewCell(title: "Sheet Large Navigation")
                        }
                        .buttonStyle(.plain)
                        .tint(.white)
                        
                    }
                }.padding(.top, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    HStack {
                        Button {
                            presentSideMenu.toggle()
                        } label: {
                            Image(systemName: "list.bullet")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(width: 24, height: 24)
                        .padding(.leading, 30)
                        
                        Spacer()
                    }
                }
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .zIndex(1)
                    .shadow(radius: 0.3)
                , alignment: .top)
            .sheet(isPresented: $showView, content: {
                PresentedView()
                    .presentationDetents([.large])
            })
            
            
            SideMenu()
        }
        
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private func SideMenu() -> some View {
        SwiftUIDesigns.SideMenu(isShowing: $presentSideMenu, direction: .leading) {
            SideViewContents(presentSideMenu: $presentSideMenu)
                .frame(width: 300)
        }
    }
}

#Preview {
    ContentView()
}
