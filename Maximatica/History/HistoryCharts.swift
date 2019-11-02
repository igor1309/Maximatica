//
//  HistoryCharts.swift
//  Maximatica
//
//  Created by Igor Malyarov on 30.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct HistoryCharts: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    
    var count: Int { self.userData.history.historySlice(period: self.settings.period).count }
    
    var body: some View {
        VStack(spacing: 16) {
            
            Picker("Period Selector", selection: $settings.period) {
                ForEach(Period.allCases, id: \.self) { period in
                    Text(period.id).tag(period)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .labelsHidden()
            .padding([.top, .horizontal])
            
            Text("Всего сеансов: \(count.formattedGrouped)".uppercased())
                .font(.headline)
                .foregroundColor(.white)
            
            if count > 0 {
                VStack(spacing: 44) {
                    #if DEBUG
                    BarChartView(title: "ОТЛАДКА: 7 последних сессий: доля правильных ответов",
                                 bars: userData.history.results.reversed()
                                    .prefix(7)
                                    .map { $0.correctAnswersShare })
                    #endif
                    
                    ForEach(History.HistoryDataType.allCases, id: \.self) { type in
                        
                        BarChartView(title: type.id,
                                     subtitle: self.userData.history.histotyData(type, for: self.settings.period).smartFormatted,
                                     bars: self.userData.history.historySlice(type, for: self.settings.period))
                    }
                    
                    Text("© photoigor")
                        .font(.caption)
                        .foregroundColor(.white)
                        .opacity(0.2)
                }
            }
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
                        .environmentObject(SettingsStore())
                }
            }
        }
        .environmentObject(UserData())
    }
}
