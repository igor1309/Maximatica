//
//  HistoryChart.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct HistoryCharts: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        VStack(alignment: .leading) {
            #if DEBUG
            BarsView(title: "Правильные ответы, доля (выборка)",
                     bars: userData.history.results
                        .prefix(5)
                        .map { $0.correctAnswersShare }
                        .reversed())
            Divider()
            #endif
            
            BarsView(title: "Правильные ответы, доля",
                     bars: userData.history.results.map { $0.correctAnswersShare }
                        .reversed())
            Divider()
            
            BarsView(title: "Количество задач",
                     bars: userData.history.results.map { $0.totalAnswers }
                        .reversed())
            Divider()
            
            BarsView(title: "Скорость",
                     bars: userData.history.results.map { $0.velocity }
                        .reversed())
            Divider()

            BarsView(title: "Темп",
                     bars: userData.history.results.map { $0.pace }
                        .reversed())
        }
        .onAppear { print(self.userData.history.results.map { $0.velocity }) }
    }
}

struct HistoryCharts_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrollView {
                HistoryCharts()
            }
        }
        .environmentObject(UserData())
    }
}
