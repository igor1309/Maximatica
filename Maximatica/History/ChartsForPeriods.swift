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
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack {
                        BarChartView(title: "score", subtitle: "\(userData.history.resultsForInterval[0].interval.end.toString())", bars: userData.history.resultsForInterval.map { $0.score }.reversed())
                        
                        BarChartView(title: "sessions", subtitle: "\(userData.history.resultsForInterval[0].interval.end.toString())", bars: userData.history.resultsForInterval.map { Double($0.sessions) }.reversed())
                        
                        BarChartView(title: "timeSpent", subtitle: "\(userData.history.resultsForInterval[0].interval.end.toString())", bars: userData.history.resultsForInterval.map { $0.timeSpent / 60 }.reversed())
                        
                        BarChartView(title: "correctAnswersShare", subtitle: "\(userData.history.resultsForInterval[0].interval.end.toString())", bars: userData.history.resultsForInterval.map { $0.correctAnswersShare }.reversed())
                        
                        BarChartView(title: "totalAnswers", subtitle: "\(userData.history.resultsForInterval[0].interval.end.toString())", bars: userData.history.resultsForInterval.map { $0.totalAnswers }.reversed())
                        
                        BarChartView(title: "correctAnswers", subtitle: "\(userData.history.resultsForInterval[0].interval.end.toString())", bars: userData.history.resultsForInterval.map { $0.correctAnswers }.reversed())
                        
                        BarChartView(title: "velocity", subtitle: "\(userData.history.resultsForInterval[0].interval.end.toString())", bars: userData.history.resultsForInterval.map { $0.velocity }.reversed())
                    }
                    .padding(.bottom, 10)
                }
                
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
