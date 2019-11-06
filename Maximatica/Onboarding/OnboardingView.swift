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
                                //Image("onboarding")
                                //    .scaledToFit()
                                //    .frame(maxWidth: .infinity, alignment: .center)
                                
                                Text("Максиматика – это приложение для тренировки навыков счёта у детей.")
                                    .font(.headline)
                                
                                OnboardingSection(image: "cursor.rays", title: "Миссия", text: "Миссия — это набор примеров, которые нужно решить.")
                                
                                OnboardingSection(image: "stopwatch", title: "Миссия «НА ВРЕМЯ»", text: "Нужно решить максимальное количество примеров за 5, 10, 15 или 20 минут:")
                                
                                MissionTimeSelector()
                                
                                OnboardingSection(image: "number", title: "Миссия «КОЛИЧЕСТВО»", text: "Требуется решить 10, 20, 50 или 100 примеров как можно быстрее:")
                                
                                MissionQtySelector()
                            }
                            
//                            Group {
//                                OnboardingSection(image: "sum", title: "Баллы" , text: "Начисляются за правильность, сложность и скорость прохождения миссии.", comment: "Система начисления баллов продолжает совершенствоваться, поэтому значения могут меняться, но не переживайте, всё считается честно!")
//
//                                OnboardingSection(image: "gear", title: "Сложность и возраст", text: "В Настройках можно менять уровень сложности решаемых примеров и возраст ребёнка.")
//
//                                OnboardingSection(image: "chart.bar", title: "Графики", text: "Показывают динамику результатов тренировок; можно выбрать период, отображаемый на графике.")
//
//                                OnboardingSection(image: "lock.shield", title: "Конфиденциальность", text: "Приложение никуда не отправляет никакие данные. Вообще. Совершенно.")
//                            }
                        }
                        .padding(.horizontal)
                        
                        SelectableButton(title: buttonTitle, selected: .constant(0), index: 1, color: .primary) {
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
                    Text("слово «Максиматика» придумал Макс в четыре года.")
                }
                .font(.subheadline)
                .foregroundColor(colorScheme == .dark ? .systemYellow : .systemIndigo)
                .padding(smallScreen ? [.horizontal, .bottom] : [.horizontal])
            }
            .padding(.top)
            .frame(maxWidth: 600, maxHeight: 900)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(buttonTitle: "Понятно, поехали")
            //            .environment(\.colorScheme, .dark)
            .environmentObject(UserData())
            .environmentObject(SettingsStore())
    }
}
