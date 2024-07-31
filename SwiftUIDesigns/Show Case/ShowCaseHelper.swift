//
//  ShowCaseHelper.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 31/7/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func showCase(order: Int,
                  title: String,
                  cornerRadius: CGFloat,
                  style: RoundedCornerStyle = .continuous,
                  scale: CGFloat = 1) -> some View {
        self
            .anchorPreference(key: HighlightAnchorKey.self, value: .bounds) { anchor in
                let highlight = HighlightShowCase(anchor: anchor, title: title, cornerRadius: cornerRadius, style: style, scale: scale)
                return [order: highlight]
            }
    }
}

struct ShowCaseRoot: ViewModifier {
    var showHighlights: Bool
    var onFinished: () -> ()

    @State private var highlightOrder: [Int] = []
    @State private var currentHightlight: Int = 0
    @State private var showView: Bool = true
    @State private var showTitle: Bool = true
    @Namespace private var animation
    func body(content: Content) -> some View {
        content
            .onPreferenceChange(HighlightAnchorKey.self) { value in
                highlightOrder = Array(value.keys).sorted()
            }
            .overlayPreferenceValue(HighlightAnchorKey.self) { preferences in
                if highlightOrder.indices.contains(currentHightlight), showHighlights, showView {
                    if let highlight = preferences[highlightOrder[currentHightlight]] {
                        HighlightView(highlight)
                    }
                }
            }
    }
    
    @ViewBuilder
    func HighlightView(_ highlight: HighlightShowCase) -> some View {
        GeometryReader { proxy in
            let highlightRect = proxy[highlight.anchor]
            let safeArea = proxy.safeAreaInsets

            Rectangle()
                .fill(.black.opacity(0.5))
                .reverseMask {
                    Rectangle()
                        .matchedGeometryEffect(id: "HIGHLIGHTSHAPE", in: animation)
                        .frame(width: highlightRect.width + 5, height: highlightRect.height + 5)
                        .clipShape(RoundedRectangle(cornerRadius: highlight.cornerRadius, style: highlight.style))
                        .scaleEffect(highlight.scale)
                        .offset(x: highlightRect.minX - 2.5, y: highlightRect.minY + safeArea.top - 2.5)
                }
                .ignoresSafeArea()
                .onTapGesture {
                    if currentHightlight >= highlightOrder.count - 1 {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            showView = false
                        }
                        onFinished()
                    } else {
                        withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.7)) {
                            showTitle = false
                            currentHightlight += 1
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            showTitle = true
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        showTitle = true
                    }
                }
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: highlightRect.width + 20, height: highlightRect.height + 20)
                .clipShape(RoundedRectangle(cornerRadius: highlight.cornerRadius, style: highlight.style))
                .popover(isPresented: $showTitle) {
                    Text(highlight.title)
                        .padding(.horizontal, 10)
                        .presentationCompactAdaptation(.popover)
                        .interactiveDismissDisabled()
                }
                .scaleEffect(highlight.scale)
                .offset(x: highlightRect.minX - 10, y: highlightRect.minY - 10)
                
        }
    }
}

extension View {
    @ViewBuilder
    func reverseMask<Content: View>(alignment: Alignment = .topLeading, @ViewBuilder content: @escaping () -> Content) -> some View {
        self
            .mask {
                Rectangle()
                    .overlay(alignment: .topLeading) {
                        content()
                            .blendMode(.destinationOut)
                    }
            }
    }
}


fileprivate struct HighlightAnchorKey: PreferenceKey {
    static var defaultValue: [Int: HighlightShowCase] = [:]
    
    static func reduce(value: inout [Int : HighlightShowCase], nextValue: () -> [Int: HighlightShowCase]) {
        value.merge(nextValue()) { $1 }
    }
}
