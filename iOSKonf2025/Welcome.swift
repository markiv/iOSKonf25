//
//  Welcome.swift
//  iOSKonf2025
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
                .animation(.easeInOut.repeatForever().delay(5)) {
                    $0.rotationEffect(.degrees(didAppear ? 0 : -15), anchor: .bottomTrailing)
                }
            Spacer()
            Text("The Power of Effortless Animations")
            Image(.ioskonf)
                .resizable().scaledToFit()
                .frame(height: 120)
            Spacer()
            Text("Vikram Kriplaney")
                .foregroundStyle(.secondary)
            (Text("iO") + Text("SK").foregroundStyle(.red) + Text("onf25")).fontWidth(.condensed)
        }
        .padding(5)
        .opacity(didAppear ? 1 : 0)
//        .font(.largeTitle.weight(.black))
        .font(.largeTitle.weight(.black))
        .multilineTextAlignment(.center)
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
