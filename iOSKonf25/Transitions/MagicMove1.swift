//
//  MagicMove1 .swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 04.05.2025.
//

import SwiftUI

/// To Show:
/// .matchedGeometryEffect(

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

#Preview {
    MagicMove1()
}
