//
//  OnboardingView.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-31.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var currentStep = 0
    
    var onComplete: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    onComplete()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Skip")
                        .padding(16)
                        .foregroundStyle(.gray)
                }
            }
            
            TabView(selection: $currentStep) {
                ForEach(0..<onboardingData.count, id: \.self) { index in
                    VStack {
                        Image(onboardingData[index].image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                        
                        Text(onboardingData[index].title)
                            .font(.title)
                            .bold()
                        
                        Text(onboardingData[index].headline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 32)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack {
                ForEach(0..<onboardingData.count, id: \.self) { index in
                    if index == currentStep {
                        Rectangle()
                            .frame(width: 20, height: 10)
                            .cornerRadius(10)
                            .foregroundColor(.orange)
                    } else {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Button {
                onComplete()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text(currentStep < onboardingData.count - 1 ? "Next" : "Get_Started")
                    .padding(16)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    OnboardingView {}
}
