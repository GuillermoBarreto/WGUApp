//
//  ContentView.swift
//  WGUApp
//
//  Created by Guillermo Barreto on 10/19/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "graduationcap.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .accessibilityHidden(true)
            Text("Welcome to WGUApp")
                .font(.title)
                .fontWeight(.bold)
                .accessibilityAddTraits(.isHeader)
            Text("Your place to organize courses, track progress, and plan study goals.")
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
