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

struct ContentView: View {
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
                LinearGradient(gradient:
                Gradient(colors: [.systemBlue, .systemGreen]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 16) {
                Group {
                    if isRunning {
                        QuestionView(questions: questions,
                                     isRunning: $isRunning,
                                     arithmetic: arithmetic)
                        Spacer()
                    } else {
                        Picker("Количество вопросов", selection: $settings.questionQty) {
                            ForEach([2, 10, 20, 50, 100], id: \.self) { qty in
                                Text("\(qty)").tag(qty)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .labelsHidden()
                        .padding()
                        
                        ForEach(Arithmetic.allCases, id: \.self) { arithmetic in
                            MathCard(arithmetic.id) { self.run(arithmetic) }
                        }
                        
                        MathCard("Всё сразу", color: .systemYellow) { self.run(nil) }
                        
                        Spacer()
                    }
                }
            }
        }
            .onAppear {
                if self.settings.questionQty == 0 {
                    self.settings.questionQty = 10
                }
            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(LinearGradient(gradient:
//                Gradient(colors: [.systemBlue, .systemGreen]),
//                                       startPoint: .topLeading,
//                                       endPoint: .bottomTrailing))
//                .edgesIgnoringSafeArea(.all)
                
                .navigationBarTitle(Text("Maximatica"))
                .navigationBarItems(trailing:
                    HStack {
                        TrailingButtonSFSymbol("gear") {
                            self.modal = .settings
                            self.showModal = true }
                        TrailingButtonSFSymbol("chart.bar") {
                            self.modal = .history
                            self.showModal = true }}
                        .accentColor(.white)
                        .disabled(isRunning))
                
                .sheet(isPresented: $showModal) {
                    if self.modal == .settings {
                        Settings()
                            .environmentObject(self.settings) }
                    
                    if self.modal == .history {
                        HistoryView()
                    }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func run(_ arithmetic: Arithmetic?) {
        if hapticsAvailable {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        self.arithmetic = arithmetic
        //  MARK: додумать анимацию
        //  rotation?
        withAnimation() {
            questions = QuestionGenerator(questionQty: settings.questionQty,
                                          arithmetic: arithmetic ?? Arithmetic.allCases.randomElement()!,
                                          complexity: settings.сomplexity).questions
            isRunning = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SettingsStore())
            .environment(\.sizeCategory, .extraLarge)
    }
}
