//
//  HistoryView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        NavigationView {
            List {
                ForEach(userData.history.results) { result in
                    HistoryRow(result: result)
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(UserData())
    }
}
