//
//  HistoryView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userData: UserData
    @State private var showModal = false
    
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
                    self.presentation.wrappedValue.dismiss() },
                trailing: TrailingButtonSFSymbol("table") {
                    self.showModal = true })
                .sheet(isPresented: $showModal) {
                    HistoryTableView()
                        .environmentObject(self.userData) }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(UserData())
    }
}
