//
//  cursorApp.swift
//  cursor
//
//  Created by zdirnecamlcs96 on 06/04/2024.
//

import SettingsAccess
import SwiftUI

@main
struct cursorApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        MenuBarExtra("cursorApp", systemImage: "cursorarrow.motionlines.click") {
            SettingsLink {
                Text("Perferences")
            }
            Button("Quit") {
                NSApplication.shared.terminate(nil)

            }.keyboardShortcut("q")
        }

        Settings {
            SettingsView()
        }
    }
}
