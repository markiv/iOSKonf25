//
//  BasicAnimationsView1.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 13.05.2025.
//

import SwiftUI

/// To Show:
/// Modifiers can be animated
/// Animation curves
/// Interactive and reversible!
/// accessibilityReduceMotion

struct BasicAnimationsView1: View {
    @State private var isToggled = false
    @Environment(\.accessibilityReduceMotion) var reduceMotion

    let logo: some View = Image(.ioskonf).resizable().scaledToFit()

    var body: some View {
        logo
            .frame(height: isToggled ? 300 : 100)
            .offset(x: isToggled ? 0 : -50, y: isToggled ? 0 : -100)
            .opacity(isToggled ? 1 : 0.5)
            .saturation(isToggled ? 1 : 0)
            .rotation3DEffect(isToggled ? .degrees(15) : .zero, axis: (x: 0.25, y: -1, z: 0.5))
            .onTapGesture {
                withAnimation(reduceMotion ? nil : .default) {
                    isToggled.toggle()
                }
            }
    }
}

#Preview {
    BasicAnimationsView1()
}
