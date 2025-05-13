//
//  ClockView.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 25.04.2025.
//

import SwiftUI

struct ClockView: View {
    @State private var startDate = Date.now

    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { context in
            Text(context.date, format: .dateTime.minute().second())
                .font(.system(size: 400, weight: .bold, design: .rounded))
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .monospacedDigit()
                .foregroundStyle(.green)
                .shadow(color: .green, radius: 20)
                .animation(.default, value: context.date)
                .contentTransition(.numericText())
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    ClockView()
}
