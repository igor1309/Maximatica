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
    @State private var showModal = false
    @State private var arithmetic: Arithmetic = .addition
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
            VStack(spacing: 16) {
                Group {
                    if isRunning {
                        MathCard("работаем…")
                    } else {
                        ForEach(Arithmetic.allCases, id: \.self) { arithmetic in
                            MathCard(arithmetic.id)
                                .onTapGesture { self.run(arithmetic) }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient:
                Gradient(colors: [.systemBlue, .systemGreen]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing))
                .edgesIgnoringSafeArea(.all)
                
                .navigationBarTitle(Text("Maximatica"))
                .navigationBarItems(trailing:
                    HStack {
                        TrailingButtonSFSymbol("gear") {
                            self.modal = .settings
                            self.showModal = true }
                        TrailingButtonSFSymbol("chart.bar") {
                            self.modal = .history
                            self.showModal = true }}
                        .accentColor(.white))
                
                .sheet(isPresented: $showModal) {
                    if self.modal == .settings {
                        Settings()
                            .environmentObject(self.settings) }
                    
                    if self.modal == .history {
                        Text("TBD: History & Graph")
                    }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func run(_ arithmetic: Arithmetic) {
        self.arithmetic = arithmetic
        //  MARK: додумать анимацию
        //  rotation?
        withAnimation() {
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
