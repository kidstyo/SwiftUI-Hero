//
//  CalendarSampleView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/19.
//

import SwiftUI

struct CalendarSampleView: View {
    @State private var selectDate: Date = Date()
    @State private var year: Int = Date().year
    @State private var month: Int = Date().month
    @State private var monthCount: [Int: Int] = [:]
    @State private var dayCount: [Int: Int] = [:]

    var body: some View {
        ScrollView{
            MonthContributionView(bindingYear: $year, bindingMonth: $month, monthCount: $monthCount)
                .padding(.horizontal)
            Divider()
            ScheduleContributionView(bindingSelectDate: $selectDate, bindingDayCount: $dayCount)
            Divider()
            TagCalendarContributionView(bindingSelectDate: $selectDate)
            Divider()
            MyCalendarView(selectDate: $selectDate)
        }
        .onAppear{
            monthCount[1] = 1
            monthCount[2] = 2
            monthCount[3] = 3
            monthCount[4] = 4
            monthCount[5] = 5
            monthCount[6] = 6
            monthCount[7] = 7
            monthCount[8] = 8
            monthCount[9] = 9
            monthCount[10] = 10

            dayCount[1] = 1
            dayCount[2] = 2
            dayCount[3] = 3
            dayCount[4] = 4
            dayCount[5] = 5
            dayCount[6] = 6
            dayCount[7] = 7
            dayCount[8] = 8
            dayCount[9] = 9
            dayCount[10] = 10
        }
    }
}

struct CalendarSampleView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarSampleView()
    }
}
