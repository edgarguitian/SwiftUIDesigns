//
//  SideViewContents.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 13/12/23.
//

import SwiftUI

struct SideViewContents: View {
    @Binding var presentSideMenu: Bool
        
        var body: some View {
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    SideMenuTopView()
                    VStack {
                        Text("Side Menu")
                            .foregroundColor(.white)
                    }.frame( maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity)
                .background(.gray)
            }
        }
        
        func SideMenuTopView() -> some View {
            VStack {
                HStack {
                    Button(action: {
                        presentSideMenu.toggle()
                    }, label: {
                        Image(systemName: "x.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                    })
                    .frame(width: 34, height: 34)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 40)
            .padding(.top, 40)
            .padding(.bottom, 30)
        }
}
