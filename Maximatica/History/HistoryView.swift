//
//  HistoryView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 30.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
import SwiftPI

struct HistoryView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userData: UserData
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                if userData.history.isListEmpty {
                    Text("Нет данных для графиков")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.vertical)
                } else {
                    HistoryCharts()
                }
            }
            .padding(.vertical, 1)
            .padding(.horizontal)
            .background(HistoryGradient())
                
            .navigationBarTitle("История")
            .navigationBarItems(
                leading: LeadingButton("Закрыть") {
                    self.presentation.wrappedValue.dismiss() })
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(UserData())
            .environmentObject(SettingsStore())
    }
}
