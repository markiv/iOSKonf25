//
//  WelcomeView.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 11.05.2025.
//
import SwiftUI

struct WelcomeView: View {
    @State private var didAppear = false

    var body: some View {
        VStack {
            Text("Здраво!") // свету
            Text("Hello!") // world
                .foregroundStyle(.secondary)

            Text("👋🏽")
                .animation(.easeInOut.repeatForever()) {
                    $0.rotationEffect(.degrees(didAppear ? 0 : -15), anchor: .bottomTrailing)
                }
            Spacer()
            Text("The Power of Effortless Animations")
            Image(.ioskonf)
                .resizable().scaledToFit()
                .frame(height: 120)
                .rotationEffect(didAppear ? .degrees(360) : .zero)
            Spacer()
            Text("Vikram Kriplaney")
                .foregroundStyle(.secondary)
            (Text("iO") + Text("SK").foregroundStyle(.red) + Text("onf") + Text("25").foregroundStyle(.secondary))
                .fontWidth(.condensed)
        }
        .padding(5)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .opacity(didAppear ? 1 : 0)
        .font(.largeTitle.weight(.black))
        .multilineTextAlignment(.center)
        .background(.orange.gradient.opacity(0.7))
        .onAppear {
            withAnimation(.easeInOut(duration: 2)) {
                didAppear = true
            }
        }
    }
}

#Preview {
    WelcomeView()
}
