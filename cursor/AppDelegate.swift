//
//  AppDelegate.swift
//  cursor
//
//  Created by zdirnecamlcs96 on 06/04/2024.
//

import Foundation
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    @ObservedObject var globalState = GlobalState.shared
    var window: NSWindow!

    var mouseLocation: NSPoint { NSEvent.mouseLocation }
    var location: NSPoint { self.window.mouseLocationOutsideOfEventStream }

    var mouseEvents: [UInt] = [
        13, // appKitDefined
        8, // mouseEntered
        5, // mouseMoved
        9, // mouseExited
        14, // systemDefined
        1, // leftMouseDown
        6, // leftMouseDragged
        2, // leftMouseUp
        3, // rightMouseDown
        4, // rightMouseUp
        7, // rightMouseDragged
    ]

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environmentObject(GlobalState.shared)

        // Create the window and set the content view.
        self.window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 30, height: 30),
            styleMask: [.borderless, .nonactivatingPanel],
            backing: .buffered, defer: false
        )
        self.window.contentView = NSHostingView(rootView: contentView)
        self.window.level = .screenSaver
        self.window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        self.window.isOpaque = false
        self.window.backgroundColor = .clear
        self.window.makeKeyAndOrderFront(nil)

        self.renderWindow()
        NSEvent.addLocalMonitorForEvents(matching: [.any], handler: self.handleMouseEvent)
//        NSEvent.addLocalMonitorForEvents(matching: [.any]) { event in
//            self.renderWindow()
//            return $0
//        }

        NSEvent.addGlobalMonitorForEvents(matching: [.any]) { event in
//            print("Global" + String(event.type.rawValue))
            if self.mouseEvents.contains(event.type.rawValue) { self.renderWindow(event: event.type.rawValue) }
        }
    }

    func applicationWillBecomeActive(_ notification: Notification) {
        print("active")
    }

    func applicationWillHide(_ notification: Notification) {
        print("hide")
    }

    func renderWindow(event: UInt? = nil) {
        let r = self.globalState.radius
        if event == 1 || event == 3 {
            GlobalState.shared.clicked = true
        } else {
            GlobalState.shared.clicked = false
        }
        self.window.setFrameOrigin(NSPoint(x: self.mouseLocation.x - r, y: self.mouseLocation.y - r))
    }

    func handleMouseEvent(event: NSEvent) -> NSEvent? {
//        print("Local" + String(event.type.rawValue))
        self.renderWindow(event: event.type.rawValue)
        return self.mouseEvents.contains(event.type.rawValue) ? event : nil
    }
}
