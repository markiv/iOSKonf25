//
//  CustomProgressView.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 07.05.2025.
//

import SwiftUI

struct CustomProgressView: View {
    @State private var didStart = false

    var body: some View {
        Circle()
            .trim(from: 0, to: 0.8)
            .stroke(.red.gradient, style: StrokeStyle(lineWidth: 40, lineCap: .round))
            .padding(100)
            .rotationEffect(.degrees(didStart ? 360 : 0))
            .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: didStart)
//            .animation(.linear(duration: 1).repeatForever(autoreverses: false)) {
//                $0.rotationEffect(.degrees(didStart ? 360 : 0))
//            }
            .onAppear {
                didStart = true
            }
    }
}

struct MyProgressViewStyle: ProgressViewStyle {
    @State private var didStart = false
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(.red.gradient, style: StrokeStyle(lineWidth: 40, lineCap: .round))
                .padding(100)
                .rotationEffect(.degrees(didStart ? 360 : 0))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: didStart)
                .onAppear {
                    didStart = true
                }
        }
    }
}

#Preview {
    CustomProgressView()
//    ProgressView("Loading...").progressViewStyle(MyProgressViewStyle())
}
