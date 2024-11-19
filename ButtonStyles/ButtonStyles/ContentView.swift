//
//  ContentView.swift
//  ButtonStyles
//
//  Created by Dennis van Mazijk on 2024/11/18.
//

import SwiftUI

struct ContentView: View {
    @State private var isDisabled = false
    @State private var isTintEnabled = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                buttonGroupView
                toggleDisabledView
                toggleTintView
            }
            .navigationTitle("Button Styles")
            .toolbarTitleDisplayMode(.inline)
            .padding()
        }
    }

    private var buttonGroupView: some View {
        Group {
            Button("Automatic") {}
                .buttonStyle(.automatic)
            Button("Borderless") {}
                .buttonStyle(.borderless)
            Button("Plain") {}
                .buttonStyle(.plain)
            Button("Bordered") {}
                .buttonStyle(.bordered)
            Button("BorderedProminent") {}
                .buttonStyle(.borderedProminent)
        }
        .disabled(isDisabled)
        .tint(isTintEnabled ? .red : .accentColor)
    }

    private var toggleDisabledView: some View {
        Toggle(isOn: $isDisabled) {
            Text("有効/無効に切り替える")
                .font(.subheadline)
                .foregroundStyle(.black.opacity(0.8))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 5)
        }
    }

    private var toggleTintView: some View {
        Toggle(isOn: $isTintEnabled) {
            Text("色を変更")
                .font(.subheadline)
                .foregroundStyle(.black.opacity(0.8))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 5)
        }
    }
}

#Preview {
    ContentView()
}
