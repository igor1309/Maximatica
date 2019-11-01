//
//  GameStatusTitle.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct GameStatusTitle: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    var title: String
    var withButtons = false
    @State private var showModal = false
    @State private var modal: Modal = .settings
    
    private enum Modal { case settings, history }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            if withButtons {
                HStack {
                    Button(action: {
                        self.modal = .settings
                        self.showModal = true
                    }) {
                        Image(systemName: "gear")
                            .padding(.top, 8)
                            .padding(.trailing, 16)
                    }
                    Button(action: {
                        self.modal = .history
                        self.showModal = true
                    }) {
                        Image(systemName: "chart.bar.fill")
                            .padding(.top, 8)
                            .padding(.trailing, 16)
                    }
                }
                .foregroundColor(.white)
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
            
            HStack {
                Text(verbatim: title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
            .padding(.top)
        }
    }
}

struct GameStatusTitle_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                MainGradient()
                
                VStack {
                    GameStatusTitle(title: "Maximatica")
                    Divider()
                    GameStatusTitle(title: "Maximatica", withButtons: true)
                }
            }
        }
        .environment(\.colorScheme, .dark)
        .environmentObject(UserData())
        .environmentObject(SettingsStore())
    }
}
