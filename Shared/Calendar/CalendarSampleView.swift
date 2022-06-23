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

    var body: some View {
        ScrollView{
            MonthContributionView(bindingYear: $year, bindingMonth: $month, monthCount: $monthCount)
                .padding(.horizontal)
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
        }
    }
}

struct CalendarSampleView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarSampleView()
    }
}
