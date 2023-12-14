//
//  TextEditorView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct TextEditorView: View {
    @State var text = "Welcome to SwiftUI Views. Get inspired and copy & paste views directly into your application"
    @State var counter = 0
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .font(.title)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .foregroundColor(.blue)
                .padding()
                .onChange(of: text, initial: true) { oldValue, newValue in
                    counter = newValue.count
                }
            Text("\(counter)")
                .foregroundColor(counter <= 280 ? .green : .red)
                .font(.system(size: 120))
        }
    }
}

#Preview {
    TextEditorView()
}
