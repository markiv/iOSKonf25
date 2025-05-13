//
//  TransitionView1.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 27.04.2025.
//

import SwiftUI

/// To Show:
/// .transition(...

struct TransitionView1: View {
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


#Preview {
    TransitionView1()
}
