//
//  Calendar.swift
//  Today_3x3
//
//  Created by kidstyo on 2022/2/8.
//  📝Version: 1⃣️
//

import Foundation

extension Calendar {
    func intervalOfWeek(for date: Date) -> DateInterval? {
    dateInterval(of: .weekOfYear, for: date)
    }

    func startOfWeek(for date: Date) -> Date? {
      // 返回周一
      // 如果是周日 则返回上周一
      if let weekday = self.dateComponents([.weekday], from: date).weekday {
          if weekday == 1{
              return date.getDay(dayDelta: -6)
          }
      }

      let start = intervalOfWeek(for: date)?.start
      return start?.dayAfter
    }

    func endOfWeek(for date: Date) -> Date? {
        let startDate = startOfWeek(for: date)
        return startDate?.getDay(dayDelta: 6)
    }

    func getDaysWithSameWeekOfYear(as date: Date) -> [Date] {
        guard let startOfWeek = startOfWeek(for: date) else {
          return []
        }

        return (0 ... 6).reduce(into: []) { result, daysToAdd in
          result.append(Calendar.current.date(byAdding: .day, value: daysToAdd, to: startOfWeek))
        }
        .compactMap { $0 }
    }
}
