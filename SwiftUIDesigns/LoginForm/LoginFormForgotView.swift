//
//  LoginFormForgotView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct LoginFormForgotView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("Login", text: $email)
                    .keyboardType(.emailAddress)
                    .padding(.top, 16)
                Divider()
                
                SecureField("Password", text: $password)
                    .padding(.top, 16)
                Divider()
                
                Button("Submit") {
                    print("Email: \(email)")
                    print("Password: \(password)")
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 20)
                
                Button(action: {
                    print("Forgot password")
                }, label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .padding(.top, 32)
                })
            }
            .navigationTitle("Login Form")
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    LoginFormForgotView()
}
