//
//  SymbolDemo1.swift
//  iOSKonf2025
//
//  Created by Vikram Kriplaney on 09.05.2025.
//

import SwiftUI

struct SymbolDemo1: View {
    @State private var wasTapped = false
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
//            .shadow(radius: 1, y: 1)
            .symbolRenderingMode(.multicolor)
//            .symbolVariant(.fill.circle.slash)
//            .symbolEffect(.breathe, value: wasTapped)
//            .symbolEffect(.variableColor, isActive: true)
            .onTapGesture {
                wasTapped.toggle()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan.gradient.secondary)
        .buttonStyle(SymbolButtonStyle())
    }

    struct SymbolButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .symbolEffect(.variableColor, value: configuration.isPressed)
                .symbolVariant(configuration.isPressed ? .slash.fill : .fill)
//                .contentTransition(.symbolEffect(.replace))
                .contentTransition(.opacity)
        }
    }
}

#Preview {
    SymbolDemo1()
}
