//
//  ContentView.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 08.04.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    link("Welcome") { WelcomeView() }
                } header: {
                    Image(.ioskonf).resizable().scaledToFit()
                        .frame(height: 80)
                        .padding(.bottom)
                        .frame(maxWidth: .infinity)
                }
                Section("Basic & Default Animations") {
                    link("Basic Animations") { BasicAnimationsView1() }
                    link("Departures") { DeparturesView() }
                    link("Grid") { Grid1View() }
                }
                Section("Continuous Animations") {
                    link("Custom Progress") { CustomProgressView() }
                }
                Section("Transitions") {
                    link("Transitions 1") { TransitionView1() }
                    link("Magic Move") { MagicMove1() }
                    link("Matched Transition Source & Navigation Transition") { Grid1View() }
                    link("Adaptive Layout Transitions") { AdaptiveLayoutDemo() }
                }
                Section("Animatable Data") {
                    link("Pie Chart") { PieChartView() }
                }
                Section("Timelines") {
                    link("Clock View") { ClockView() }
                }
                Section("Symbol Effects") {
                    link("Symbol Effects") { SymbolDemo1() }
                }
                Section("Other Kinds of Animation") {
                    link("Hero Video") { HeroVideoView() }
                    link("Sprites") { SpriteDemoView() }
                }
                Section {
                    link("Thank You!") { ThanksView() }
                }
            }
            .navigationTitle("The Power of Effortless Animations")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    @ViewBuilder func link(_ title: LocalizedStringKey, @ViewBuilder _ destination: () -> some View) -> some View {
        NavigationLink(title) {
            destination()
                .navigationTitle(title)
        }
    }
}

#Preview {
    ContentView()
}
