//
//  CalendarSampleView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/19.
//

import SwiftUI

struct CalendarSampleView: View {
    @State private var selectDate: Date = Date()

    var body: some View {
        VStack{
            Spacer()
            MyCalendarView(selectDate: $selectDate)
        }
    }
}

struct CalendarSampleView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarSampleView()
    }
}
