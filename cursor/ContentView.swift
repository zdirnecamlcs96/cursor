//
//  ContentView.swift
//  cursor
//
//  Created by zdirnecamlcs96 on 06/04/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var globalState: GlobalState

    var body: some View {
        GeometryReader { geometry in
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(/*@START_MENU_TOKEN@*/ .blue/*@END_MENU_TOKEN@*/)
                .frame(width: globalState.radius, height: globalState.radius)
                .scaleEffect(globalState.clicked ? 1.5 : 1)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                .padding(2)
        }
        .frame(width: globalState.radius * 2, height: globalState.radius * 2)
        
    }
}

#Preview {
    ContentView()
}
