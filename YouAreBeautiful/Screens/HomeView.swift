//
//  HomeView.swift
//  YouAreBeautiful
//
//  Created by Utku Güzel on 29.06.2023.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = false
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        
        VStack(spacing: 20){
            //MARK: - HEADER
                
            Spacer()
                
            ZStack{
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.2)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 20 : -20)
                    .animation(
                        Animation
                            .easeOut(duration: 4)
                            .repeatForever()
                        , value: isAnimating)
                    
            }

                
            //MARK: - CENTER
                
            Text("Love is a great great great master. It teaches us to be what we never were.")
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .padding()
                
                            
            //MARK: - FOOTER
            
            Spacer()
            
            Button(action: {
                playSound(sound: "success", type: "m4a")
                isOnboardingViewActive = true
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }//: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .padding()
                
        }//: VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                isAnimating = true
            })
        })
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
