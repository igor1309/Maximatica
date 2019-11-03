//
//  OnboardingView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 03.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    @Environment(\.presentationMode) var presentation
    
    @Environment(\.colorScheme) var colorScheme
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
                                Text("Максиматика – это приложение для тренировки навыков счёта у детей.")
                                    .font(.headline)

                                OnboardingSection(image: "cursor.rays", title: "Миссия", text: "Миссия — это набор примеров, которые нужно решить.")

                                OnboardingSection(image: "stopwatch", title: "Миссия «НА ВРЕМЯ»", text: "Нужно решить максимальное количество примеров за 5, 10, 15 или 20 минут:")

                                MissionTimeSelector()

                                OnboardingSection(image: "number", title: "Миссия «КОЛИЧЕСТВО»", text: "Требуется решить 10, 20, 50 или 100 примеров как можно быстрее:")

                                MissionQtySelector()
                            }
                            
                            Group {
                                OnboardingSection(image: "sum", title: "Баллы" , text: "Начисляются за правильность, сложность и скорость прохождения миссии **.")
                                
                                OnboardingSection(image: "gear", title: "Сложность и возраст", text: "В Настройках можно менять уровень сложности решаемых примеров и возраст ребёнка.")
                                
                                OnboardingSection(image: "chart.bar", title: "Графики", text: "Показывают динамику, можно выбрать период, отображаемый на графике.")
                                
                                HStack(alignment: .firstTextBaseline, spacing: 3) {
                                    Text("** ").frame(width: 36, alignment: .leading)
                                    Text("Система начисления баллов продолжает совершенствоваться, поэтому значения могут меняться, но не переживайте, всё честно!")
                                }
                                .font(.footnote)
                                .opacity(0.4)
                                .padding(.vertical)
                            }
                        }
                        .padding(.horizontal)
                        
                        SelectableButton(title: "Понятно, поехали", selected: .constant(0), index: 1, color: .primary) { self.settings.hasLaunchedBefor = true }
                            .padding(.vertical)
                    }
                }
//                .foregroundColor(.black)
                .padding([.top, .horizontal])
                
                Divider()
                
                HStack(alignment: .firstTextBaseline, spacing: 3) {
                    Text("* ")
                    Text("слово «Максиматика» придумал Макс в 2016.")
                }
                .font(.subheadline)
//                .foregroundColor(.systemBlue)
                .padding(smallScreen ? [.horizontal, .bottom] : [.horizontal])
            }
            .padding(.top)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environment(\.colorScheme, .dark)
            .environmentObject(UserData())
            .environmentObject(SettingsStore())
    }
}
