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
        VStack(spacing: 32) {
            #if DEBUG
            BarChartView(title: "ОТЛАДКА: 5 последних правильных ответов",
                         subtitle: "Показывается только при отладке. Возможно нужна аналогичная опция, например селектором последние 5/30/все…",
                         bars: userData.history.results
                            .prefix(5)
                            .map { $0.correctAnswersShare }
                            .reversed())
            #endif
            
            BarChartView(title: "Правильные ответы",
                         subtitle: "Доля правильных ответов",
                         bars: userData.history.results.map { $0.correctAnswersShare }
                            .reversed())
            
            BarChartView(title: "Количество задач",
                         subtitle: "Количество задач в серии",
                         bars: userData.history.results.map { $0.totalAnswers }
                            .reversed())
            
            BarChartView(title: "Скорость",
                         subtitle: "Задач в минуту",
                         bars: userData.history.results.map { $0.velocity }
                            .reversed())
            
            BarChartView(title: "Темп",
                         subtitle: "Секунд на одну задачу",
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
