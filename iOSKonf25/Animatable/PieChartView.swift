//
//  PieChartView.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 05.05.2025.
//

import SwiftUI


/// To Show:
/// animatableData
/// $value.animation

struct PacMan: Shape {
    var value: Double

    var animatableData: Double {
        get { value }
        set { value = newValue }
    }

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.midX, rect.midY)
        return Path { path in
            path.move(to: center)
            path.addLine(to: CGPoint(x: 2 * radius, y: rect.midY))
            path.addRelativeArc(
                center: center, radius: radius,
                startAngle: .zero, delta: .degrees(360 * value),
            )
            path.addLine(to: center)
        }
    }
}

struct PieChartView: View {
    @State private var value = 0.875

    var body: some View {
        VStack {
            PacMan(value: value)
                .fill(.orange.gradient.shadow(.inner(radius: 3, y: -1)))
                .shadow(radius: 8, y: 8)
            Slider(value: $value)
            Button("Toggle") {
                withAnimation(.easeInOut(duration: 2)) {
                    value = value == 0 ? 1 : 0
                }
//                $value.animation(.easeInOut(duration: 2)).wrappedValue = value == 0 ? 1 : 0
            }
        }
        .padding()
    }
}

#Preview {
    PieChartView()
}
