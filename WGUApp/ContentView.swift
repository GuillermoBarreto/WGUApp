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
        // Scrollable so the Get started section stays reachable on small
        // screens with large Dynamic Type sizes.
        ScrollView {
            VStack(spacing: 16) {
            VStack(spacing: 16) {
                Image(systemName: "graduationcap.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .accessibilityHidden(true)
                Text("Welcome to WGUApp")
                    .font(.title)
                    .fontWeight(.bold)
                    // Wrap instead of shrinking: at large Dynamic Type sizes,
                    // minimumScaleFactor would shrink the title to 50% and make
                    // it hard to read. Two lines stay legible everywhere.
                    .lineLimit(2)
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
                ForEach(Array(gettingStartedSteps.enumerated()), id: \.offset) { index, step in
                    Label(step, systemImage: "checkmark.circle.fill")
                        .foregroundStyle(.secondary)
                        .accessibilityIdentifier("getStartedStep-\(index)")
                }
            }
            .padding(.top, 4)
            .accessibilityIdentifier("getStartedSteps")
        }
            }
            .padding()
            // Fill the available space so the welcome card stays centered on any screen size.
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            // Keep the content vertically centered when it fits without scrolling (iOS 17+).
            .containerRelativeFrame(.vertical, alignment: .center)
        }
    }
}

#Preview("iPhone 16 Pro") {
    ContentView()
}

#Preview("iPhone SE", traits: .fixedLayout(width: 375, height: 667)) {
    ContentView()
}

// Render in dark mode to catch contrast issues with the secondary text and tinted icon.
#Preview("Dark Mode", traits: .preferredColorScheme(.dark)) {
    ContentView()
}
