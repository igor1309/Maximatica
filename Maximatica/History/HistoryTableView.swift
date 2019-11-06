//
//  HistoryTableView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
import SwiftPI

struct HistoryTableView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userData: UserData
    @State private var showAction = false
    
    var isIPad: Bool { UIDevice.current.userInterfaceIdiom == .pad }
    
    var body: some View {
        NavigationView {
            HistoryTable()
                .navigationBarTitle("История (таблица)")
                .navigationBarItems(
                    leading: LeadingButton("Закрыть") {
                        self.presentation.wrappedValue.dismiss() },
                    trailing: TrailingButtonSFSymbol("trash") {
                        if self.isIPad {
                            self.resetHistory()
                        } else {
                            self.showAction = true }})
                .actionSheet(isPresented: $showAction) {
                    ActionSheet(title: Text("Удалить все записи в истории?".uppercased()),
                                message: Text("Это действие невозможно отменить."),
                                buttons: [.cancel(),
                                          .destructive(Text("Да, удалить все"),
                                                       action: { self.resetHistory() })])}
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func resetHistory() {
        userData.history.reset()
    }
}

struct HistoryTableView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryTableView()
            .environmentObject(UserData())
    }
}
