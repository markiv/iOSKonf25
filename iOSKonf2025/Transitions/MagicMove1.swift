//
//  MagicMove1 .swift
//  iOSKonf2025
//
//  Created by Vikram Kriplaney on 04.05.2025.
//

import SwiftUI

struct CompactItemView: View {
    let namespace: Namespace.ID

    var body: some View {
        HStack {
            Image(.ioskonf)
                .resizable()
                .frame(width: 36, height: 36)
                .matchedGeometryEffect(id: "icon", in: namespace)

            Text("Zdravo, iOSKonf!")
                .matchedGeometryEffect(id: "title", in: namespace)
        }
    }
}

struct ExpandedItemView: View {
    let namespace: Namespace.ID

    var body: some View {
        VStack(alignment: .leading) {
            Text("Zdravo, iOSKonf!").bold()
                .matchedGeometryEffect(id: "title", in: namespace)
            HStack(alignment: .top) {
                Text(placeholder: 12)
                    .foregroundStyle(.secondary)
                Spacer()
                Image(.ioskonf)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .matchedGeometryEffect(id: "icon", in: namespace)
            }
        }
    }
}

struct ItemView: View {
    @Namespace var namespace
    @State private var isSelected = false

    var body: some View {
        Button {
            $isSelected.animation(.easeInOut).wrappedValue.toggle()
        } label: {
            if isSelected {
                ExpandedItemView(namespace: namespace)
            } else {
                CompactItemView(namespace: namespace)
            }
        }
        .foregroundStyle(.foreground)
    }
}

struct MagicMove1: View {
    @Namespace var ns
    @State private var isSelected = false

    var body: some View {
        List {
            ItemView()
            ItemView()
            ItemView()
            ItemView()
            ItemView()
            ItemView()
            ItemView()
        }
    }
}

extension View {
    func headerStyle() -> some View {
        padding(4)
            .frame(maxWidth: .infinity)
            .background(
                .ultraThinMaterial.opacity(0.7),
                in: .rect(
                    cornerRadii: RectangleCornerRadii(
                        topLeading: 10,
                        bottomLeading: 0,
                        bottomTrailing: 0,
                        topTrailing: 10
                    ),
                    style: .continuous
                )
            )
    }

    func sectionStyle() -> some View {
        padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                .ultraThinMaterial.opacity(0.2),
                in: .rect(
                    cornerRadii: RectangleCornerRadii(
                        topLeading: 0,
                        bottomLeading: 10,
                        bottomTrailing: 10,
                        topTrailing: 0
                    ),
                    style: .continuous
                )
            )
            .padding(.bottom)
    }
}

#Preview {
//    List {
//        Section {
//            Text("Hello, world!")
//            Text("Hello, world!")
//            Text("Hello, world!")
//        } header: {
//            Text("Header 1")
//        }
//        .listRowBackground(Rectangle().fill(.ultraThinMaterial))
//    }
//    .scrollContentBackground(.hidden)
//    .background(.teal.gradient)
//    .listStyle(.insetGrouped)

    //    MagicMove1()

    ScrollView {
        LazyVGrid(columns: [.init()], alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
            Section {
                VStack {
                    ForEach(Country.all.prefix(12)) {
                        Text($0.capital)
                            .padding(4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .sectionStyle()

            } header: {
                Text("Header 1").headerStyle()
            }

            Section {
                VStack {
                    ForEach(Country.all.dropFirst(12).prefix(12)) {
                        Text($0.capital)
                            .padding(4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .sectionStyle()
            } header: {
                Text("Header 2").headerStyle()
            }

            Section {
                VStack {
                    ForEach(Country.all.dropFirst(24).prefix(30)) {
                        Text($0.capital)
                            .padding(4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .sectionStyle()
            } header: {
                Text("Header 3").headerStyle()
            }
        }
    }
    .cornerRadius(10)
    .clipped()
    .padding()
    .background(.teal.gradient)
}
