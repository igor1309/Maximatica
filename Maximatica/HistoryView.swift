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
    var body: some View {
        NavigationView {
            HistoryTable()
                .navigationBarTitle("История")
                .navigationBarItems(leading: LeadingButton("Закрыть") {
                    self.presentation.wrappedValue.dismiss() })
            
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(UserData())
    }
}
