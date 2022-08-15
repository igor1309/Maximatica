//
//  HistoryForPeriods.swift
//  Maximatica
//
//  Created by Igor Malyarov on 11.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
import SwiftPI

struct ResRow: View {
    var res: ResultForInterval
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Total Score: \(res.score.formattedGrouped)")
                
                Spacer()
                
                Text(res.interval.start.toString())
                    + Text(" - ")
                    + Text((res.interval.end - 1).toString())
            }
            
            Text("\(res.sessions) session(s) ")
            
            Text("Total time: \(res.timeSpent.formatMinutesSeconds)")
            
            Text(res.correctAnswers.formattedGrouped)
                + Text(" of ")
                + Text(res.totalAnswers.formattedGrouped)
                + Text(" (")
                + Text(res.correctAnswersShare.formattedPercentage)
                + Text(")")
            
            
            Text("\(res.velocity.formattedGrouped) ответов в минуту")
            
            Text("\(res.pace.formattedGrouped) сек. на ответ")
        }
        //        .font(.subheadline)
    }
}

struct HistoryForPeriods: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            ForEach(userData.history.resultsForInterval
//                .sorted(by: { $0.interval.start > $1.interval.start })
            ) { res in
                ResRow(res: res)
            }
        }
    }
}

struct HistoryForPeriods_Previews: PreviewProvider {
    static var previews: some View {
        HistoryForPeriods()
            .environmentObject(UserData())
    }
}
