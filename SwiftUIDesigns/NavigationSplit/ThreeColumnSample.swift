//
//  ThreeColumnSample.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 12/7/24.
//

import SwiftUI

struct ThreeColumnSample: View {
    @State private var firstSelectedDataItem: DataModel?
    @State private var secondSelectedDataItem: DataModel?
    @State private var thirdSelectedDataItem: DataModel?
    
    var body: some View {
        NavigationSplitView {
            List(SampleData.firstScreenData, selection: $firstSelectedDataItem) { item in
                NavigationLink(item.text, value: item)
            }
            .navigationTitle("Simple Navigation")
        } content: {
            VStack(alignment: .leading) {
                if firstSelectedDataItem != nil {
                    Text("Previously Selected Item: \(firstSelectedDataItem!.text)")
                }
                List(SampleData.secondScreenData, selection: $secondSelectedDataItem) { item in
                    NavigationLink(item.text, value: item)
                }
                .navigationTitle("Content")
            }.padding()
        } detail: {
            VStack(alignment: .leading) {
                if secondSelectedDataItem != nil {
                    Text("Previously Selected Item: \(secondSelectedDataItem!.text)")
                        .padding()
                }
                List(SampleData.lastScreenData, selection: $thirdSelectedDataItem) { item in
                    Text(item.text)
                }
            }
            .navigationTitle("Detail")
        }
    }
}

#Preview {
    ThreeColumnSample()
}

struct DataModel: Identifiable, Hashable {
    let id = UUID()
    let text: String
}

class SampleData {
    static let firstScreenData = [
        DataModel(text: "⚽️ Fútbol"),
        DataModel(text: "🎾 Tenis"),
        DataModel(text: "🏀 Baloncesto"),
        DataModel(text: "🏐 Voleibol"),
        DataModel(text: "🏊‍♂️ Natación")
    ]
    
    static let secondScreenData = [
        DataModel(text: "🐢 Lento"),
        DataModel(text: "🚶‍♂️ Moderado"),
        DataModel(text: "🏃‍♂️ Rápido"),
        DataModel(text: "🚀 Muy rápido")
    ]
    
    static let lastScreenData = [
        DataModel(text: "❌ Incorrecto"),
        DataModel(text: "🤔 Regular"),
        DataModel(text: "✔️ Correcto"),
        DataModel(text: "🌟 Excelente")
    ]
}
