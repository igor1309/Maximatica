//
//  Settings.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
import CoreHaptics

var hapticsAvailable: Bool { CHHapticEngine.capabilitiesForHardware().supportsHaptics }

struct Settings: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var settings: SettingsStore
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemTeal]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemTeal]
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Количество вопросов".uppercased())) {
                    Picker("Количество вопросов", selection: $settings.questionQty) {
                        ForEach([2, 10, 20, 50, 100], id: \.self) { qty in
                            Text("\(qty)").tag(qty)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .labelsHidden()
                }
                
                Section(header: Text("Уровень сложности".uppercased())) {
                    Picker("Сложность", selection: $settings.сomplexity) {
                        ForEach(Complexity.allCases, id: \.self) { сomplexity in
                            Text(сomplexity.rawValue).tag(сomplexity)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .labelsHidden()
                }
                
                Section(header: Text("Возраст".uppercased())) {
                    Picker("Возраст", selection: $settings.ageGroup) {
                        ForEach(AgeGroup.allCases, id: \.self) { age in
                            Text(age.rawValue).tag(age)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .labelsHidden()
                }
                
                Section(header: Text("Правильный ответ".uppercased()),
                        footer: Text("Правильный ответ можно показыать сразу или в конце.")) {
                    Toggle("Показывать сразу", isOn: $settings.showCorrectAnswer)
                        .font(.subheadline)
                }
                .disabled(true)

                Section(header: Text("Таймер".uppercased()),
                        footer: Text("Показывать ли таймер при выполнении задания.")) {
                    Toggle("Показывать таймер", isOn: $settings.showTimer)
                        .font(.subheadline)
                }
                .disabled(true)
            }
            .navigationBarTitle("Настройки")
            .navigationBarItems(leading: LeadingButton("Закрыть") { self.presentation.wrappedValue.dismiss() })
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .environmentObject(SettingsStore())
            //                    .environment(\.colorScheme, .dark)
            .environment(\.sizeCategory, .extraLarge)
    }
}
