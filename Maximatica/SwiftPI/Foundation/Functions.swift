//
//  Functions.swift
//  
//
//  Created by Igor Malyarov on 11.11.2019.
//

import Foundation

/// Функция создает массив интервалов заданной длины для заданных стартовой и конечной даты
/// - Parameters:
///   - component: длина интервала (неделя по умолчанию)
///   - startDate: начальна дата, попадающая в первый интервал
///   - endDate: конечная дата, попадает в последний интервал
@available(OSX 10.12, *)
public func dateIntervals(of component: Calendar.Component = .weekOfYear, startDate: Date, endDate: Date) -> [DateInterval] {
    let calendar = Calendar.autoupdatingCurrent
    var intervals = [DateInterval]()
    var date = startDate
    while date <= endDate {
        let interval = calendar.dateInterval(of: component, for: date)!
        intervals.append(interval)
//        print(interval.end)
        date = interval.end + 1
//        print(date)
    }
    return intervals
}
