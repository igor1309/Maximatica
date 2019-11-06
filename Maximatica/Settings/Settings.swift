//
//  Settings.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
import CoreHaptics
import SwiftPI

var hapticsAvailable: Bool { CHHapticEngine.capabilitiesForHardware().supportsHaptics }

struct Settings: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    @State private var showModal = false
    @State private var showModal2 = false
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemTeal]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemTeal]
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Возраст".uppercased())) {
                    Picker("Возраст", selection: $userData.ageGroup) {
                        ForEach(AgeGroup.allCases, id: \.self) { age in
                            Text(age.rawValue).tag(age)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .labelsHidden()
                }
                
                Section(header: Text("Сложность".uppercased()),
                        footer: Text("Уровень сложности вопросов.")) {
                            Picker("Сложность", selection: $userData.complexity) {
                                ForEach(Complexity.allCases, id: \.self) { complexity in
                                    Text(complexity.rawValue).tag(complexity)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .labelsHidden()
                }
                
                Section(header: Text("Вопросы".uppercased()),
                        footer: Text("Количество вопросов в миссии.")) {
                            MissionQtySelector()
                }
                
                //Section(header: Text("Результаты".uppercased())) {
                Section {
                    Button("Таблица результатов") {
                        self.showModal = true
                    }
                    .sheet(isPresented: $showModal) {
                        HistoryTableView()
                            .environmentObject(self.userData) }
                }
                
                Section(header: Text("Инфо".uppercased())) {
                    Button("О приложении") {
                        self.showModal2 = true
                    }
                    .sheet(isPresented: $showModal2) {
                        OnboardingView(buttonTitle: "OK, ЗАКРЫТЬ")
                            .environmentObject(self.userData)
                            .environmentObject(SettingsStore())
                    }
                }
            }
            .navigationBarTitle("Настройки")
            .navigationBarItems(leading: LeadingButton("Закрыть") { self.presentation.wrappedValue.dismiss() })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .environmentObject(UserData())
            .environmentObject(SettingsStore())
            //                    .environment(\.colorScheme, .dark)
            .environment(\.sizeCategory, .extraLarge)
    }
}
