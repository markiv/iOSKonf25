//
//  ThanksView.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 14.05.2025.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

struct ThanksView: View {
    @State private var didAppear = false

    var body: some View {
        VStack {
            Group {
                Text("Фала!") // свету
                Text("Thank you!") // world
                    .foregroundStyle(.secondary)
                Text("🙏🏽")
            }
            .font(.largeTitle.weight(.black))

            Image(.qrCode).resizable().scaledToFit()
            Text("[github.com/markiv/iOSKonf25](https://github.com/markiv/iOSKonf25)")

            Image(.ioskonf)
                .resizable().scaledToFit()
                .frame(height: 60)
                .rotationEffect(didAppear ? .degrees(360) : .zero)

            Text("[linktr.ee/vkrips](https://linktr.ee/vkrips)")
        }
        .font(.title.bold())
        .padding(5)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .opacity(didAppear ? 1 : 0)
        .multilineTextAlignment(.center)
//        .background(.orange.gradient.opacity(0.5))
        .background(HeroVideoBackground().hueRotation(.degrees(180)))
        .onAppear {
            withAnimation(.easeInOut(duration: 2)) {
                didAppear = true
            }
        }
    }
}

#Preview {
    ThanksView()
}
