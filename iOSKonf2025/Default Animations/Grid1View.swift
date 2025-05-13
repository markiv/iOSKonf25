//
//  Grid1View.swift
//  iOSKonf2025
//
//  Created by Vikram Kriplaney on 29.04.2025.
//

import SwiftUI

extension Grid1View {
    @Observable class ViewModel {
        struct Item: Identifiable, Hashable {
            let label: String
            let color: Color
            let id = UUID()

            static func random(index: Int) -> Item {
                let letter = Character(UnicodeScalar(65 + index)!)
                return .init(
                    label: "Item \(letter)",
                    color: Color(hue: .random(in: 0...1), saturation: 0.7, brightness: 1)
                )
            }
        }

        var items = (0 ..< 12).map { Item.random(index: $0) }

        func sort() {
            items.sort { $0.label < $1.label }
        }
    }
}

struct Grid1View: View {
    private let vm = ViewModel()
    @State private var width = 120.0
    @State private var selectedItem: ViewModel.Item?
    @Namespace private var animation

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: width))], spacing: 10) {
                ForEach(vm.items) { item in
                    Text(item.label)
                        .frame(width: width, height: 50)
                        .background(item.color.gradient.shadow(.drop(radius: 3)), in: .buttonBorder)
                        .onTapGesture { selectedItem = item }
                        .matchedTransitionSource(id: item.id, in: animation)
                }
            }
            .animation(.default, value: vm.items)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button("", systemImage: "dice") { vm.items.shuffle() }
                        Slider(value: $width, in: 80...300)
                        Button("", systemImage: "arrow.up.arrow.down") { vm.sort() }
                    }
                }
            }
            .sheet(item: $selectedItem) {
                DetailView(item: $0)
                    .navigationTransition(.zoom(sourceID: $0.id, in: animation))
            }
        }
    }

    struct DetailView: View {
        let item: ViewModel.Item

        var body: some View {
            VStack {
                Text(item.label)
                    .font(.largeTitle)
                Text(placeholder: 25)
            }
            .multilineTextAlignment(.center)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(item.color.gradient)
        }
    }
}

#Preview {
    NavigationStack {
        Grid1View()
    }
}
