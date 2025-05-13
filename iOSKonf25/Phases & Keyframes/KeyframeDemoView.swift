//
//  KeyframeDemoView.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 14.05.2025.
//

import SwiftUI

struct KeyframeDemoView: View {
    var body: some View {
        Text("iOSKonf25")
            .font(.largeTitle.bold())
            .keyframeAnimator(initialValue: 0, repeating: true) { view, value in
                view
                    .offset(y: value)
                    .scaleEffect(value / 20)
                    .rotationEffect(.degrees(value / 10))
            } keyframes: { value in
                LinearKeyframe(50, duration: 3)
                LinearKeyframe(0, duration: 1)
            }
    }
}

#Preview {
    KeyframeDemoView()
}
