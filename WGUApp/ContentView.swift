//
//  ContentView.swift
//  WGUApp
//
//  Created by Guillermo Barreto on 10/19/25.
//

import SwiftUI

/// The welcome screen: a centered card introducing WGUApp and its purpose.
struct ContentView: View {
    /// Shared by the subtitle and the VoiceOver label so the two can't drift apart.
    private let welcomeMessage = "Your place to organize courses, track progress, and plan study goals."

    /// First steps for new users, matching the tracking features in the README.
    private let gettingStartedSteps = [
        "Add your courses to track them in one place.",
        "Mark courses complete as you finish them.",
        "Set study goals to stay on pace.",
    ]

    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 16) {
                Image(systemName: "graduationcap.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .accessibilityHidden(true)
                Text("Welcome to WGUApp")
                    .font(.title)
                    .fontWeight(.bold)
                    // Keep the title on one line so minimumScaleFactor can shrink it
                    // instead of wrapping on narrow screens.
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .accessibilityAddTraits(.isHeader)
                .accessibilityIdentifier("welcomeTitle")
                Text(welcomeMessage)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            // Read the welcome card as a single VoiceOver element instead of three.
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Welcome to WGUApp. \(welcomeMessage)")
            .accessibilityIdentifier("welcomeCard")

            VStack(alignment: .leading, spacing: 8) {
                Text("Get started")
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)
                ForEach(gettingStartedSteps, id: \.self) { step in
                    Label(step, systemImage: "checkmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.top, 4)
            .accessibilityIdentifier("getStartedSteps")
        }
        .padding()
        // Fill the available space so the welcome card stays centered on any screen size.
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview("iPhone 16 Pro") {
    ContentView()
}

#Preview("iPhone SE", traits: .fixedLayout(width: 375, height: 667)) {
    ContentView()
}
