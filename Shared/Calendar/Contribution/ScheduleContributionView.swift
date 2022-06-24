//
//  ScheduleContributionView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/23.
//

import SwiftUI

struct ScheduleContributionView: View {
    @Binding var bindingSelectDate: Date

    // [day, count]
    @Binding var bindingDayCount: [Int: Int]

    @State private var dateValueArray : [DateValue] = []

    let LEVEL: Int

    // MARK: 常量
    let DAY_SIZE: CGFloat = 25

    func updateDateArray(){
        dateValueArray = extractDate()
    }

    var body: some View {
        VStack(spacing: 10){
            // MARK: 日期和前后月选择
            HStack(spacing: 20){
                HStack{
                    Text("\(bindingSelectDate.year)")
                        .font(.body.bold())

                    Text(bindingSelectDate.month.toMonth())
                        .font(.callout.bold())
                        .foregroundColor(Color.theme.primary)
                }

                Spacer(minLength: 0)

                Image(systemName: "chevron.left")
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .onTapGesture {
                        HapticManager.instance.impact()
                        updateMonth(delta: -1)
                    }

                Image(systemName: "chevron.right")
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .onTapGesture {
                        HapticManager.instance.impact()
                        updateMonth(delta: 1)
                    }
            }
            .padding(.horizontal)

            // MARK: Week
            HStack{
                ForEach(weekDayStrs, id: \.self){day in
                    Text(day)
                        .font(.caption2).bold()
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 4)

            // Dates...
            // Lazy Grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns) {
                ForEach(dateValueArray){value in
                    DayRectangle(value: value)
                        .onTapGesture {
                            HapticManager.instance.impact()
                            bindingSelectDate = value.date
                        }
                }
            }
            .padding(.horizontal, 4)
        }
        .onAppear(perform: {
            updateDateArray()
        })
        .onChange(of: bindingSelectDate) { newValue in
            updateDateArray()
        }
    }

    @ViewBuilder
    func DayRectangle(value: DateValue) -> some View{
        ZStack{
            if value.day != -1{
                Rectangle()
                    .fill(Color("ContributeBackgroud"))
                    .frame(width: DAY_SIZE, height: DAY_SIZE)
                    .cornerRadius(2)

                Rectangle()
                    .fill(Color("ContributeForeground"))
                    .frame(width: DAY_SIZE, height: DAY_SIZE)
                    .opacity(getOpacity(count: bindingDayCount[value.day] ?? 0, levelSpacing: LEVEL))
                    .cornerRadius(2)

                Text("\(value.day)")
                    .font(.footnote)
                    .foregroundColor((bindingDayCount[value.day] ?? 0)  > 0 ? .white : .secondary)
            }
        }
    }

    func updateMonth(delta: Int){
        var newMonth = bindingSelectDate.month + delta
        var newYear = bindingSelectDate.year
        if newMonth > 12{
            newMonth = 1
            newYear += 1
        }

        if newMonth < 1{
            newMonth = 12
            newYear -= 1
        }
        updateDay(newYear: newYear, newMonth: newMonth, newDay: 1)
    }

    func extractDate() -> [DateValue]{
        let calendar = Calendar.current

        // Getting Current Month Date...
        let newMonthDate = getNewDate(newYear: bindingSelectDate.year, newMonth: bindingSelectDate.month)

        var days = newMonthDate.getAllDates().compactMap { date -> DateValue in
            // getting day...
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }

        // adding offset days to get exact week day...
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())

        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }

        return days
    }

    func updateDay(newYear: Int, newMonth: Int, newDay: Int){
        bindingSelectDate = getNewDate(newYear: newYear, newMonth: newMonth, newDay: 1)
    }
}

struct ScheduleContributionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack{
                ScheduleContributionView(bindingSelectDate: .constant(Date()), bindingDayCount: .constant([:]), LEVEL: 1)
                Spacer()
            }
            .navigationTitle("Test")
        }
    }
}
