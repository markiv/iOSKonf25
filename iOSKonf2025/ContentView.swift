//
//  ContentView.swift
//  iOSKonf2025
//
//  Created by Vikram Kriplaney on 08.04.2025.
//

import SwiftUI

struct ContentView: View {
    var viewModel = ListViewModel()

    var body: some View {
        List {
            NavigationLink("Departures") { DeparturesView() }
            NavigationLink("Adaptive Layout") { AdaptiveLayoutDemo() }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
