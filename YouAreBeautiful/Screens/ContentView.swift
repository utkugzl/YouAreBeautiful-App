//
//  ContentView.swift
//  YouAreBeautiful
//
//  Created by Utku Güzel on 29.06.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = true
    
    var body: some View {
        
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

