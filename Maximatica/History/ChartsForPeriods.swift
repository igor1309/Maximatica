//
//  ChartsForPeriods.swift
//  Maximatica
//
//  Created by Igor Malyarov on 11.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ChartsForPeriods: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView {
            VStack {
                HorizontalCharts()
                
                List {
                    ForEach(userData.history.resultsForInterval) { res in
                        ResRow(res: res)
                    }
                }
            }
            .navigationBarTitle("Weekly")
        }
    }
}

struct ChartsForPeriods_Previews: PreviewProvider {
    static var previews: some View {
        ChartsForPeriods()
            .environmentObject(UserData())
            .environment(\.colorScheme, .dark)
    }
}
