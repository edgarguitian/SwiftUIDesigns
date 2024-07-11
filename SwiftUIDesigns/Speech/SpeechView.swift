//
//  SpeechView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 11/7/24.
//

import SwiftUI
import AVFAudio

struct SpeechView: View {
    @State private var textoToSpeech = ""
    @State private var speechSynthesizer: AVSpeechSynthesizer?

    var body: some View {
        VStack {
            ZStack {
                
                RoundedRectangle(cornerRadius: 45)
                    .stroke(Color.gray, lineWidth: 1)
                    .padding(.horizontal, 30)
                    .frame(width: .infinity, height: 50, alignment: .center)
                    .padding()

                TextField("", text: $textoToSpeech)
                    .placeholder(when: textoToSpeech.isEmpty) {
                        Text("Introduce el texto a speech").foregroundColor(.black)

                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .center)
                    .padding()
            }
                
            
            Button(action: {
                speak(message: textoToSpeech)
            }, label: {
                Text("Speech")
            })
            .buttonStyle(.borderedProminent)
        }
    }
    
    func speak(message: String) {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSession.Category.playAndRecord)
            try session.setActive(true)
            let synth = AVSpeechSynthesizer()
            print("Routes:: \(session.currentRoute.outputs)")
            if let currentChannels = session.currentRoute.outputs.first?.channels {
                synth.outputChannels = currentChannels
                print("Found channels \(currentChannels)")
            }
            let utterance = AVSpeechUtterance(string: message)
            utterance.voice = AVSpeechSynthesisVoice(language: "es-ES")
            utterance.rate = 0.1

            speechSynthesizer = AVSpeechSynthesizer()
            speechSynthesizer?.speak(utterance)
            
        } catch {
            print(error)
        }
        }
}

#Preview {
    SpeechView()
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .center,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
