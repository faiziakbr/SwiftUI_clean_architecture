//
//  RootView.swift
//  CleanArchitecture
//
//  Created by Faizan Akbar on 03/03/2025.
//

import SwiftUI

struct RootView: View {
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                HomeView()
//                if !AppState.isOnboardingAppeared {
//                    OnboardingView()
//                }
//                else if !AppState.isLoggedIn {
//                    VerifyNumberView()
//                }
//                else {
//                    TabBarView()
//                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    RootView()
}
