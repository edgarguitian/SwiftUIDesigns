//
//  AnimatedCharts.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 12/7/24.
//

import SwiftUI
import Charts

struct AnimatedCharts: View {
    /// View Properties
    @State private var appDownloads: [Download] = sampleDownloads
    @State private var isAnimated: Bool = false
    @State private var trigger: Bool = false
    @State private var selectedMode: ChartStyle = .barMark
    @Namespace private var animation

    var body: some View {
        NavigationStack {
            VStack {
                CustomSegmentedPicker()

                Chart {
                    ForEach(appDownloads) { download in
                        if selectedMode == .barMark {
                            BarMark(
                                x: .value("Month", download.month),
                                y: .value("Downloads", download.isAnimated ? download.value : 0)
                            )
                            .foregroundStyle(.red.gradient)
                            .opacity(download.isAnimated ? 1 : 0)
                        } else if selectedMode == .lineMark {
                            LineMark(
                                x: .value("Month", download.month),
                                y: .value("Downloads", download.isAnimated ? download.value : 0)
                            )
                            .foregroundStyle(.red.gradient)
                            .opacity(download.isAnimated ? 1 : 0)
                        } else if selectedMode == .sectorMark {
                            SectorMark(
                                angle: .value("Downloads", download.isAnimated ? download.value : 0)
                            )
                            .foregroundStyle(by: .value("Month", download.month))
                            .opacity(download.isAnimated ? 1 : 0)
                        } else if selectedMode == .areaMark {
                            AreaMark(
                                x: .value("Month", download.month),
                                y: .value("Downloads", download.isAnimated ? download.value : 0)
                            )
                            .foregroundStyle(.red.gradient)
                            .opacity(download.isAnimated ? 1 : 0)
                        }
                    }
                }
                .chartYScale(domain: 0...12000)
                .frame(height: 250)
                .padding()
                .background(.background, in: .rect(cornerRadius: 10))
                
                Spacer(minLength: 0)
            }
            .padding()
            .background(.gray.opacity(0.12))
            .navigationTitle("Animated Chart's")
            .onAppear(perform: animateChart)
            .onChange(of: trigger, initial: false) { oldValue, newValue in
                resetChartAnimation()
                animateChart()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Trigger") {
                        trigger.toggle()
                    }
                }
            }
        }
    }
    
    private func animateChart() {
        guard !isAnimated else { return }
        isAnimated = true
        
        $appDownloads.enumerated().forEach { index, element in
            let delay = Double(index) * 0.05
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(.smooth) {
                    element.wrappedValue.isAnimated = true
                }
            }
        }
    }
    
    private func resetChartAnimation() {
        $appDownloads.forEach { download in
            download.wrappedValue.isAnimated = false
        }
        
        isAnimated = false
    }
    
    @ViewBuilder
    private func CustomSegmentedPicker() -> some View {
        HStack(spacing: 10) {
            ForEach(ChartStyle.allCases, id: \.rawValue) { chartStyle in
                Text(chartStyle.rawValue)
                    .padding(.vertical, 10)
                    .frame(width: 80)
                    .background {
                        ZStack {
                            if selectedMode == chartStyle {
                                Capsule()
                                    .fill(.themeBG)
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            }
                        }
                        .animation(.snappy, value: chartStyle)
                    }
                    .contentShape(.rect)
                    .onTapGesture {
                        selectedMode = chartStyle
                        resetChartAnimation()
                        animateChart()
                    }
            }
        }
        .padding(5)
        .background(.primary.opacity(0.06), in: .capsule)
        .padding(.top, 20)
    }
}

#Preview {
    AnimatedCharts()
}

enum ChartStyle: String, CaseIterable {
    case barMark = "Bar"
    case lineMark = "Line"
    case sectorMark = "Sector"
    case areaMark = "Area"
}
