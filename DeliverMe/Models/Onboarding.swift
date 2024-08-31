//
//  Onboarding.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-31.
//

import Foundation

struct OnboardingItem: Identifiable {
    var id = UUID()
    let title: String
    let headline: String
    let image: String
}

let onboardingData: [OnboardingItem] = [
    OnboardingItem(
        title: "Onboarding_Screen_One_Title".localized(),
        headline: "Onboarding_Screen_One_Headline".localized(),
        image: "onboarding-image-1"
    ),
    OnboardingItem(
        title: "Onboarding_Screen_Two_Title".localized(),
        headline: "Onboarding_Screen_Two_Headline".localized(),
        image: "onboarding-image-2"
    )
]
