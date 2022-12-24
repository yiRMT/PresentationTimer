//
//  CircleProgressView.swift
//  PresentationTimer
//
//  Created by iwashita on 2022/09/02.
//

import SwiftUI

struct CircleProgressView: View {
    var from: Double
    var to: Double
    var width: Double
    var color: Color
    
    var body: some View {
        Circle()
            .trim(from: CGFloat(self.from), to: CGFloat(self.to))
            .stroke(color, lineWidth: CGFloat(width))
            .rotationEffect(.degrees(-90))
    }
}

struct CircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressView(from: 0.0, to: 0.25, width: 50, color: .pink)
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
