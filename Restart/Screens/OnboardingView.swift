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
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                // MARK: - HEADER
                
                Spacer()
                
                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: HEADER
                
                // MARK: - CENTER
                
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } //: CENTER
                
                Spacer()
                
                // MARK: - FOOTER (BUTTON)
                
                ZStack {
                    // PARTS OF THE CUSTOM BUTTON
                    
                    // 1. BACKGROUND (STATIC)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    // 2. CALL-TO-ACTION (STATIC)
                    
                    Text("Get Starting")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 28)
                    
                    // 3. CAPSULE RED PART (DYNAMIC WIDTH)
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        
                        Spacer()
                    }
                    
                    // 4. CIRCLE (DRAGGABLE)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8) // 8 is smaller than the default padding area
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        } // ZSTACK for the red button
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
//                        .onTapGesture {<#code#>}
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 { //when value changes
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    buttonOffset = 0 //when finished drag, button go back
                                }
                        ) //: GESTURE: 1.start of drag (onChanged) 2. end of drag gesture (onEnd) (width: left&right)
                        
                        Spacer() // right side push to left when its hstack
                        
                    } // HSTACK
                    
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center) //here frame the button length
                .padding() //*
            } //: VSTACK
        } //: ZSTACK
    }
}

// MARK: - REVIEW
#Preview {
    OnboardingView()
}
