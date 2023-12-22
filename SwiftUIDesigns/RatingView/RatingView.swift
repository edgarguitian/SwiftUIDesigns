//
//  RatingView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct RatingView: View {
    var rating: Int
    var maxRating: Int = 5
    var starSize: CGFloat = 60.0
    var activeColor: Color = Color.yellow
    var inactiveColor: Color = Color.gray
    
    private var stars: [Bool] {
        var result = [Bool]()
        for i in 1...maxRating {
            result.append(i <= rating)
        }
        return result
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<stars.count, id: \.self) { index in
                Image(systemName: stars[index] ? "star.fill" : "star")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(stars[index] ? activeColor : inactiveColor)
                    .frame(width: starSize, height: starSize)
                    .accessibility(label: Text(stars[index] ? "Estrella completa" : "Estrella vacía"))
            }
        }
    }
}

#Preview {
    VStack {
        RatingView(rating: 1)
        RatingView(rating: 2)
        RatingView(rating: 3)
        RatingView(rating: 4)
        RatingView(rating: 5)
    }
}
