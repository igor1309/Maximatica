//
//  HorizontalCharts.swift
//  Maximatica
//
//  Created by Igor Malyarov on 11.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct HorizontalCharts: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                BarChartView(title: "Results: Score", subtitle: "\(userData.history.resultsForInterval[0].interval.end.toString())", bars: userData.history.resultsForInterval.map { $0.score }.reversed())
                
                BarChartView(title: "Results: Correct Answers Share", subtitle: "", bars: userData.history.resultsForInterval.map { $0.correctAnswersShare }.reversed())
                
                BarChartView(title: "Results: Pace", subtitle: "seconds per question", bars: userData.history.resultsForInterval.map { $0.pace }.reversed())
                
                BarChartView(title: "Engagement: Sessions", subtitle: "", bars: userData.history.resultsForInterval.map { Double($0.sessions) }.reversed())
                
                BarChartView(title: "Engagement: Time Spent", subtitle: "total, min", bars: userData.history.resultsForInterval.map { $0.timeSpent }.reversed())
                
                BarChartView(title: "Engagement: Total Answers", subtitle: "", bars: userData.history.resultsForInterval.map { $0.totalAnswers }.reversed())
            }
            .padding(.bottom, 10)
        }
    }
}

struct HorizontalCharts_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                HorizontalCharts()
            }
        }
        .environmentObject(UserData())
        .environment(\.colorScheme, .dark)
    }
}
