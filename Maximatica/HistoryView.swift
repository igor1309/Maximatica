//
//  HistoryView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct HistoryTable: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            ForEach(userData.history.results) { result in
                HistoryRow(result: result)
            }
        }
    }
}


struct HistoryView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userData: UserData
    @State private var showModal = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                HistoryCharts()
            }
            .padding()
            .background(LinearGradient(gradient:
                Gradient(colors: [.orange, .yellow, .blue]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                .opacity(0.99)
                .edgesIgnoringSafeArea(.all))
                
                .navigationBarTitle("История")
                .navigationBarItems(leading: LeadingButton("Закрыть") {
                    self.presentation.wrappedValue.dismiss() },
                                    trailing: TrailingButtonSFSymbol("table") {
                                        self.showModal = true })
                .sheet(isPresented: $showModal) {
                    NavigationView {
                        HistoryTable()
                            .environmentObject(self.userData)
                            .navigationBarTitle("История (таблица)")
                            .navigationBarItems(leading: LeadingButton("Закрыть") {
                                self.presentation.wrappedValue.dismiss() })}}
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(UserData())
    }
}
