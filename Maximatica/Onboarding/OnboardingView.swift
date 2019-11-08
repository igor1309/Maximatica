//
//  OnboardingView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 03.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    
    var buttonTitle: String
    let smallScreen = UIScreen.main.bounds.height < 700
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                Gradient(colors: colorScheme == .dark ? [.blue, .systemIndigo] : [.systemTeal, .yellow]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                Group {
                    Text("MAXImatica")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        + Text("*").font(.title)
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(alignment: .leading, spacing: 8) {
                            Group {
                                //Image("onboarding").scaledToFit().frame(maxWidth: .infinity, alignment: .center)
                                
                                Text("shortAbout")
                                    .font(.headline)
                                
                                OnboardingSection(image: "cursor.rays", title: "mission", text: "missionAbout")
                                
                                OnboardingSection(image: "stopwatch", title: "timeMission", text: "timeMissionAbout")
                                
                                MissionTimeSelector()
                                
                                OnboardingSection(image: "number", title: "qtyMssion", text: "qtyMssionAbout")
                                
                                MissionQtySelector()
                            }
                            
                            Group {
                                OnboardingSection(image: "sum", title: "score" , text: "scoreAbout", comment: "scoreNote")
                                
                                OnboardingSection(image: "gear", title: "complexityAndAge", text: "complexityAndAgeAbout")
                                
                                OnboardingSection(image: "chart.bar", title: "charts", text: "chartsAbout")
                                
                                OnboardingSection(image: "lock.shield", title: "privacy", text: "privacyAbout")
                            }
                        }
                        .padding(.horizontal)
                        
                        SelectableButton(title: buttonTitle, selected: .constant(0), index: 1, color: colorScheme == .dark ? .systemYellow : Color(0x0E4CAB)) {
                            if self.settings.hasLaunchedBefor {
                                self.presentation.wrappedValue.dismiss()
                            } else {
                                self.settings.hasLaunchedBefor = true
                            }
                        }
                        .padding(.vertical)
                    }
                }
                .padding([.top, .horizontal])
                
                Divider()
                
                HStack(alignment: .firstTextBaseline, spacing: 3) {
                    Text("* ")
                    Text("wordMAXImatica")
                }
                .font(.subheadline)
                .foregroundColor(colorScheme == .dark ? .systemYellow : .primary)
                .padding(smallScreen ? [.horizontal, .bottom] : [.horizontal])
            }
            .padding(.top)
            .frame(maxWidth: 600, maxHeight: 1000)    
        }
        .accessibility(identifier: "onboardingView")
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(buttonTitle: "Понятно, поехали")
                        .environment(\.colorScheme, .dark)
            .environmentObject(UserData())
            .environmentObject(SettingsStore())
    }
}
