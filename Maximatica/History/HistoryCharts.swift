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
            BarChartView(title: "Правильные ответы, доля (выборка)",
                         bars: userData.history.results
                            .prefix(5)
                            .map { $0.correctAnswersShare }
                            .reversed())
            Divider()
            #endif
            
            BarChartView(title: "Правильные ответы, доля",
                         bars: userData.history.results.map { $0.correctAnswersShare }
                            .reversed())
            Divider()
            
            BarChartView(title: "Количество задач",
                         bars: userData.history.results.map { $0.totalAnswers }
                            .reversed())
            Divider()
            
            BarChartView(title: "Скорость",
                         bars: userData.history.results.map { $0.velocity }
                            .reversed())
            Divider()
            
            BarChartView(title: "Темп",
                         bars: userData.history.results.map { $0.pace }
                            .reversed())
        }
    }
}

struct HistoryCharts_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                HistoryGradient()
                
                ScrollView {
                    HistoryCharts()
                }
            }
        }
        .environmentObject(UserData())
    }
}
