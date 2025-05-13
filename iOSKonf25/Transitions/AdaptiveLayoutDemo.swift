//
//  AdaptiveLayoutDemo.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 15.05.2025.
//

import SwiftUI

struct AdaptiveLayoutDemo: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    var body: some View {
        let layout = verticalSizeClass == .regular ?
            AnyLayout(VStackLayout(spacing: 5)) : AnyLayout(HStackLayout())
        layout {
            ForEach(0..<10, id: \.self) { index in
                let color = Color(hue: Double(index) / 10.0, saturation: 0.6, brightness: 1)
                Text("\(index)")
                    .font(.largeTitle)
                    .padding(.horizontal, 10)
                    .padding(10)
                    .background(color.gradient, in: .rect(cornerRadius: 10))
                    .aspectRatio(1, contentMode: .fill)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .animation(.spring(duration: 1), value: verticalSizeClass)
    }
}

#Preview {
    AdaptiveLayoutDemo()
}
