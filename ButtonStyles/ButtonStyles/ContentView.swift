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

            Button {} label: {
                Text("CustomStyle")
                    .padding(.vertical, 7)
                    .padding(.horizontal)
            }
            .buttonStyle(CustomButtonStyle())
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

private struct CustomButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .background(.blue)
            .opacity(isEnabled ? (configuration.isPressed ? 0.5 : 1) : 0.5)
            .cornerRadius(8)
    }
}

#Preview {
    ContentView()
}
