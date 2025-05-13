//
//  SymbolDemo1.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 09.05.2025.
//

import SwiftUI

/// To Show:
/// .symbolEffect(

struct SymbolDemo1: View {
    let symbols = [
        "heart.fill", "rainbow", "touchid", "square.and.arrow.up", "xmark", "star", "bookmark",
        "cloud.rainbow.crop", "folder",
        "trash", "calendar.badge.plus"
    ]

    var body: some View {
        LazyVGrid(columns: [.init(.adaptive(minimum: 80))]) {
            ForEach(symbols, id: \.self) { name in
                Button {} label: {
                    Image(systemName: name)
                        .resizable()
                        .scaledToFit()
                        .padding(5)
                }
            }
            .symbolRenderingMode(.multicolor)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan.gradient.secondary)
        .buttonStyle(SymbolButtonStyle())
    }

    struct SymbolButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .symbolEffect(.bounce, isActive: configuration.isPressed)
                .symbolVariant(configuration.isPressed ? .fill : .none)
//                .contentTransition(.symbolEffect(.replace))
//                .contentTransition(.opacity)
        }
    }
}

#Preview {
    SymbolDemo1()
}
