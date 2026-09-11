//
//  OnboardingView.swift
//  Restart
//
//  Created by Janus 333 on 2026/9/12.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button(action: {
                //action - state changes
                isOnboardingViewActive = false
            }) {
                Text("Start")
            }
        } //: VStacl
    }
}

// MARK: - REVIEW
#Preview {
    OnboardingView()
}
