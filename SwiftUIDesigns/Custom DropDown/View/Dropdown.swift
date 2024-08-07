//
//  Dropdown.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 15/7/24.
//

import SwiftUI

// Dropdown Overlay
extension View {
    @ViewBuilder
    func dropdownOverlay(_ config: Binding<DropdownConfig>, values: [String]) -> some View {
        self
            .overlay {
                if config.wrappedValue.show {
                    DropDownView(values: values, config: config)
                        .transition(.identity)
                }
            }
    }
}

fileprivate struct DropDownView: View {
    var values: [String]
    @Binding var config: DropdownConfig
    // View Properties
    @State private var activeItem: String?
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ItemView(config.activeText)
                    .id(config.activeText)

                ForEach(filteredValues, id: \.self) { item in
                    ItemView(item)
                }
            }
            .scrollTargetLayout()
        }
        .safeAreaPadding(.bottom, 200 - config.anchor.height)
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
        .scrollPosition(id: $activeItem, anchor: .top)
        .scrollIndicators(.hidden)
        .frame(width: config.anchor.width, height: 200)
        .background(.background)
        .mask(alignment: .top) {
            Rectangle()
                .frame(height: config.showContent ? 200 : config.anchor.height, alignment: .top)
        }
        .overlay(alignment: .topTrailing) {
            Image(systemName: "chevron.down")
                .rotationEffect(.init(degrees: config.showContent ? 180 : 0))
                .padding(.trailing, 15)
                .frame(height: config.anchor.height)
        }
        .clipShape(.rect(cornerRadius: config.cornerRadius))
        .offset(x: config.anchor.minX, y: config.anchor.minY)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background {
            if config.showContent {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .reverseMask(.topLeading) {
                        RoundedRectangle(cornerRadius: config.cornerRadius)
                            .frame(width: config.anchor.width, height: 200)
                            .offset(x: config.anchor.minX, y: config.anchor.minY)
                    }
                    .transition(.opacity)
                    .onTapGesture {
                        closeDropdown(config.activeText)
                    }
            }
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func ItemView(_ item: String) -> some View {
        HStack {
            Text(item)
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 15)
        .frame(height: config.anchor.height)
        .contentShape(.rect)
        .onTapGesture {
            closeDropdown(item)
        }
    }
    
    func closeDropdown(_ item: String) {
        withAnimation(.easeInOut(duration: 0.35), completionCriteria: .logicallyComplete) {
            activeItem = item
            config.showContent = false
        } completion: {
            config.activeText = item
            config.show = false
        }
    }
    
    var filteredValues: [String] {
        values.filter({ $0 != config.activeText })
    }
}

// ReverseMasking
extension View {
    @ViewBuilder
    func reverseMask<Content: View>(_ alignment: Alignment, @ViewBuilder content: @escaping() -> Content) -> some View{
        self
            .mask {
                Rectangle()
                    .overlay(alignment: alignment) {
                        content()
                            .blendMode(.destinationOut)
                    }
            }
    }
}

// Source View
struct SourceDropdownView: View {
    @Binding var config: DropdownConfig

    var body: some View {
        HStack {
            Text(config.activeText)
            
            Spacer(minLength: 0)
            
            Image(systemName: "chevron.down")
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(.background, in: .rect(cornerRadius: config.cornerRadius))
        .contentShape(.rect(cornerRadius: config.cornerRadius))
        .onTapGesture {
            config.show = true
            withAnimation(.snappy(duration: 0.35, extraBounce: 0)) {
                config.showContent = true
            }
        }
        .background(
            GeometryReader { geometry in
                Color.clear
                    .preference(key: FramePreferenceKey.self, value: geometry.frame(in: .global))
            }
        )
        .onPreferenceChange(FramePreferenceKey.self) { newValue in
            config.anchor = newValue
        }
    }
}

struct FramePreferenceKey: PreferenceKey {
    typealias Value = CGRect
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

// Dropdown Config
struct DropdownConfig {
    var activeText: String
    var show: Bool = false
    var showContent: Bool = false
    // Source View Position
    var anchor: CGRect = .zero
    var cornerRadius: CGFloat = 10
}

struct Dropdown: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DropdownView()
}
