//
//  HistoryRow.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
import SwiftPI

struct HistoryRow: View {
    var result: TestResult
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack(alignment: .firstTextBaseline) {
                Text("Арифметика: \(result.arithmetic?.id ?? "все"), ")
                    + Text("\(result.complexity.id), ")
                    + Text("\(result.ageGroup.id)")
                Spacer()
                VStack(alignment: .trailing) {
                    Text(result.dateTime.dateAndTimetoString())
                    Text("баллы: ").font(.caption)
                    + Text(Score(testResult: result).finalScore.formattedGrouped)
                        .foregroundColor(.primary)
                }
                .font(.subheadline)
            }
            .foregroundColor(.secondary)
            
            Text("Правильно ")
                + Text("\(result.correctAnswersShare.formattedPercentage) ").bold()
                + Text("[\(result.correctAnswers.formattedGrouped) из \(result.totalAnswers.formattedGrouped)] ")
                + Text("за \(result.timeSpent.formatMinuteSecond)")
            
            Text("\(result.velocity.formattedGrouped) ответов в минуту (\(result.pace.formattedGrouped) сек. на ответ)")
                .foregroundColor(.secondary)
            
            
        }
        .font(.callout)
    }
}

struct HistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List() {
                ForEach(loadHistory.results) { result in
                    HistoryRow(result: result)
                }
            }
        }
        .environment(\.sizeCategory, .extraLarge)
        //    .environment(\.colorScheme, .dark)
    }
}
