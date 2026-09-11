//
//  HomeView.swift
//  Restart
//
//  Created by Janus 333 on 2026/9/12.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing:20) {
            Text("Home")
                .font(.largeTitle)
            
            Button(action: {
                //action
                isOnboardingViewActive = true
            }) {
                Text("Restart")
            }
        } // :VSTACK
    }
}

// MARK: - PREVIEW
#Preview {
    HomeView()
}
