//
//  SettingView.swift
//  cursor
//
//  Created by zdirnecamlcs96 on 06/04/2024.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    private enum Tabs: Hashable {
        case general, advanced
    }

    var body: some View {
        TabView {
            GeneralSettingsView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
                .tag(Tabs.general)
        }
        .padding(20)
        .frame(width: 375, height: 150)
    }
}

struct GeneralSettingsView: View {
    @AppStorage("startAtLogin") private var startAtLogin = false
    @ObservedObject var globalState = GlobalState.shared
    var body: some View {
        Form {
            Toggle("Start At Login", isOn: $startAtLogin)
            Slider(value: $globalState.radius, in: 30 ... 60) {
                Text("Radius (\(globalState.radius, specifier: "%.0f") pts)")
            }
        }
        .padding(20)
        .frame(width: 350, height: 100)
    }
}
