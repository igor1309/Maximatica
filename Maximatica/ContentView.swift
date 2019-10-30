//
//  ContentView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//
//  inspired by Paul Hudson https://www.hackingwithswift.com/guide/ios-swiftui/3/3/challenge
//

import SwiftUI
import SwiftPI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    @State private var isRunning = false
    @State private var arithmetic: Arithmetic? = nil
    @State private var questions: [Question] = []
    @State private var showModal = false
    @State private var modal: Modal = .settings
    
    private enum Modal { case settings, history }
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                MainGradient()
                
                VStack(spacing: 16) {
                    if isRunning {
                        QuestionView(questions: questions,
                                     isRunning: $isRunning,
                                     arithmetic: arithmetic)
                    } else {
                        GameSelectionView(isRunning: $isRunning,
                                          arithmetic: $arithmetic,
                                          questions: $questions)
                    }
                    Spacer()
                }
            }
            .onAppear {
                if self.settings.questionQty == 0 {
                    self.settings.questionQty = 10 }}
                
                .navigationBarTitle(Text("Maximatica"))
                .navigationBarItems(
                    trailing: HStack {
                        TrailingButtonSFSymbol("gear") {
                            self.modal = .settings
                            self.showModal = true }
                        TrailingButtonSFSymbol("chart.bar.fill") {
                            self.modal = .history
                            self.showModal = true }
                            .opacity(userData.history.isListEmpty ? 0.3 : 1) }
                        .accentColor(.white)
                        .opacity(isRunning ? 0.4 : 1)
                        .disabled(isRunning))
                
                .sheet(isPresented: $showModal) {
                    if self.modal == .settings {
                        Settings()
                            .environmentObject(self.userData)
                            .environmentObject(self.settings) }
                    
                    if self.modal == .history {
                        HistoryView()
                            .environmentObject(self.userData)
                            .environmentObject(self.settings) }}
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
            .environmentObject(SettingsStore())
            .environment(\.sizeCategory, .extraLarge)
    }
}
