//
//  GlobalState.swift
//  cursor
//
//  Created by zdirnecamlcs96 on 20/04/2024.
//

import Foundation
import SwiftUI

final class GlobalState: ObservableObject {
    static let shared = GlobalState(clicked: false) // singleton design

    @Published var radius: Double = UserDefaults.standard.double(forKey: "radius") {
        didSet {
            UserDefaults.standard.set(radius, forKey: "radius")
        }
    }

    @Published var clicked: Bool

    init(clicked: Bool) {
        self.clicked = clicked
    }

    func setRadius(value: Double) {
        radius = value
    }
}
