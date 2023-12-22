//
//  LoginFormView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct LoginFormView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("Login", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .padding(.top, 16)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top, 16)
                
                Button("Submit", systemImage: "key.fill") {
                    print("Email: \(email)")
                    print("Password: \(password)")
                }
                .buttonStyle(.bordered)
                .padding(.top, 20)
            }
            .padding(.horizontal, 32)
            .navigationTitle("Login Form")
        }
    }
}

#Preview {
    LoginFormView()
}
