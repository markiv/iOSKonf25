//
//  Transition1.swift
//  iOSKonf2025
//
//  Created by Vikram Kriplaney on 27.04.2025.
//

import SwiftUI

struct Transition1: View {
    @State private var showDetail = false

    var body: some View {
        VStack(spacing: 10) {
            Text(placeholder: 5).font(.largeTitle.bold())
            Text(placeholder: 24)
            if showDetail {
                Image(.ioskonf)
                    .resizable().scaledToFit()
                    .frame(width: 200, height: 200)
                    .transition(.scale.combined(with: .opacity))
                Text(placeholder: 15)
                    .foregroundStyle(.secondary)
            }
            Button(showDetail ? "Show Less" : "Show More") {
                showDetail.toggle()
            }
            Text(placeholder: 26)
            Text(placeholder: 12)
        }
        .multilineTextAlignment(.center)
        .padding()
        .animation(.easeInOut, value: showDetail)
    }
}

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
//        .animation(.spring(duration: 1), value: verticalSizeClass)
    }
}

#Preview {
//    Transition1()
    AdaptiveLayoutDemo()
}
