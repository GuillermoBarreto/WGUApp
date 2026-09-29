//
//  ContentView.swift
//  WGUApp
//
//  Created by Guillermo Barreto on 10/19/25.
//

import SwiftUI

struct ContentView: View {
    /// Shared by the subtitle and the VoiceOver label so the two can't drift apart.
    private let welcomeMessage = "Your place to organize courses, track progress, and plan study goals."

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "graduationcap.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .accessibilityHidden(true)
            Text("Welcome to WGUApp")
                .font(.title)
                .fontWeight(.bold)
                .minimumScaleFactor(0.8)
                .accessibilityAddTraits(.isHeader)
            Text(welcomeMessage)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        // Fill the available space so the welcome card stays centered on any screen size.
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        // Read the welcome card as a single VoiceOver element instead of three.
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Welcome to WGUApp. \(welcomeMessage)")
    }
}

#Preview {
    ContentView()
}
