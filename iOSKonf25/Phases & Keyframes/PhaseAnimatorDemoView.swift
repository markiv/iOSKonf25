//
//  PhaseAnimatorDemoView.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 15.05.2025.
//

import SwiftUI

struct PhaseAnimatorDemoView: View {
    var body: some View {
        Text("iOSKonf25")
            .font(.largeTitle.bold())
            .phaseAnimator([0, 1, 2]) { view, phase in
                view
                    .scaleEffect(phase)
                    .opacity(phase == 1 ? 1 : 0)
            }
    }
}

#Preview {
    PhaseAnimatorDemoView()
}
