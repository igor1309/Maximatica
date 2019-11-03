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
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                Gradient(colors: [.systemTeal, .yellow]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                Group {
                    Text("Maximatica")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        + Text("*").font(.title)
                    //                    Spacer()
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            Group {
                                Text("Максиматика – это приложение для тренировки навыков счёта у детей.")
                                    .font(.headline)
                                
                                Text("\nТренировка называется миссией.")
                                
                                Text("Миссия ")
                                    + Text("«НА ВРЕМЯ»").font(.headline)
                                    + Text(": решить максимальное количество примеров за 5, 10, 15 или 20 минут:")
                                
                                MissionTimeSelector()
                                
                                Text("\nМиссия ")
                                    + Text("«КОЛИЧЕСТВО»").font(.headline)
                                    + Text(": решить 10, 20, 50 или 100 примеров как можно быстрее:")
                                MissionQtySelector()
                            }
                            
                            Text("\nБаллы").font(.headline)
                            + Text(" начисляются за правильность, сложность и скорость прохождения миссии **.")
                            
                            Text("В ")
                                + Text("Настройках").font(.headline)
                                + Text(" можно менять уровень сложности и возраст ребёнка.")
                            
                            Text("Графики").font(.headline)
                            + Text(" показывают динамику, можно выбрать период, отображаемый на графике.")
                    
                            HStack(alignment: .firstTextBaseline, spacing: 3) {
                            Text("** ")
                            Text("Система начисления баллов продолжает совершенствоваться, поэтому значения могут меняться, но не переживайте, всё честно!")
                            }
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
                
                //                Group {
                //                    Text("body secondary")
                //                        .foregroundColor(.secondary)
                //                    Text("largeTitle")
                //                        .font(.largeTitle)
                //                    Text("title")
                //                        .font(.title)
                //                    Text("headline")
                //                        .font(.headline)
                //                    Text("callout")
                //                        .font(.callout)
                //                    Text("subheadline")
                //                        .font(.subheadline)
                //                    Text("footnote")
                //                        .font(.footnote)
                //                    Text("caption")
                //                        .font(.caption)
                //                    Spacer()
                //                }
                
                SelectableButton(title: "Понятно, поехали", selected: .constant(0), index: 1) { self.settings.hasLaunchedBefor = true }
//                    .padding(.bottom)
                Divider()
                HStack(alignment: .firstTextBaseline, spacing: 3) {
                    Text("* ")
                    Text("слово «Максиматика» придумал Макс в 2016 году.")
                }
                .font(.subheadline)
                .foregroundColor(.systemBlue)
                .padding(.horizontal)
//                .padding([.horizontal, .bottom])
            }
            .padding(.top)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(UserData())
            .environmentObject(SettingsStore())
    }
}
