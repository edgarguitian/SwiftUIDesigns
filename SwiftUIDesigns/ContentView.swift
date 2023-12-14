//
//  ContentView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 13/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var presentSideMenu = false
    @State var showSheetLargeNavigation: Bool = false
    @State var showSheetNavigation: Bool = false
    @State var showFullModalNavigation: Bool = false
    let itemsStackNavigation: [String] = ["Stack Navigation"]
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        NavigationLink(destination: TabBarT()) {
                            ContentViewCell(title: "3D Tab Bar")
                        }
                        
                        Button {
                            showSheetLargeNavigation.toggle()
                        } label: {
                            ContentViewCell(title: "Sheet Large Navigation")
                        }
                        .buttonStyle(.plain)
                        .tint(.white)
                        
                        Button {
                            showSheetNavigation.toggle()
                        } label: {
                            ContentViewCell(title: "Sheet Navigation")
                        }
                        .buttonStyle(.plain)
                        .tint(.white)
                        
                        Button {
                            showFullModalNavigation.toggle()
                        } label: {
                            ContentViewCell(title: "Full Modal Navigation")
                        }
                        .buttonStyle(.plain)
                        .tint(.white)
                        
                        
                        ForEach(itemsStackNavigation, id: \.self) { item in
                            NavigationLink(value: item) {
                                Text(item)
                                
                            }
                        }.navigationDestination(for: String.self) { itemStackNavigation in
                            VStack {
                                ZStack {
                                    Color.yellow
                                    VStack {
                                        Text("Selected Item")
                                            .font(.largeTitle)
                                            .bold()
                                        Text(itemStackNavigation)
                                            .font(.system(size: 20))
                                            .bold()
                                        Spacer()
                                    }
                                    .padding(.top, 160)
                                }
                            }
                            .ignoresSafeArea()
                        }
                        
                        
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
            .sheet(isPresented: $showSheetLargeNavigation, content: {
                SheetLargeNavigation()
                    .presentationDetents([.large])
            })
            .sheet(isPresented: $showSheetNavigation, content: {
                SheetNavigation()
                    .presentationDetents([
                        .medium,
                        .fraction(0.3)
                    ])
            })
            .fullScreenCover(isPresented: $showFullModalNavigation, content: {
                FullModalNavigation()
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
