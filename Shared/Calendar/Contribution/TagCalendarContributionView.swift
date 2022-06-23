//
//  MyCalendarContributionView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/20.
//

import SwiftUI

/*
 3x3 Tag
 */
struct TagCalendarContributionView: View {
    @Binding var bindingSelectDate: Date
    @State var dayDic : [Int : Bool] = [:]

    // 全部完成/数据正常
    @State var dayGreenDic : [Int : Bool] = [:]

    // 未完成/数据有问题
    @State var dayRedDic : [Int : Bool] = [:]

    // 有放弃的，优先级低于未完成
    @State var dayGiveUpDic : [Int : Bool] = [:]

    @State var dateValueArray : [DateValue] = []
//    @State var tagEntity: TagEntity? = nil

    // 选中的显示大小
    let CHOSE_CIRCLE_SIZE: CGFloat = 32
    let POINT_SIZE: CGFloat = 6

    // MARK: 常量
    let MONTH_SIZE: CGFloat = 25
    let DAY_SIZE: CGFloat = 26

    func updateCheck(){
        print("updateCheck:\(bindingSelectDate.toStringTitle())")
        dayDic = [:]
        dayGreenDic = [:]
        dayRedDic = [:]
        dayGiveUpDic = [:]

        dateValueArray = extractDate()
        for item in dateValueArray {
//            // 数据判断重复
//            if funcType == FuncType.CloudData{
//                let days = viewModel.fetchAllDayEntity(day: item.date)
//                if days.count >= 1{
//                    dayDic[item.day] = true
//                    if days.count > 1{
//                        dayRedDic[item.day] = true
//                    }
//                    else{
//                        dayGreenDic[item.day] = true
//                    }
//                }
//            }
//
//            // 时间线界面查看
//            if funcType == FuncType.Schedule{
//                if viewModel.IsHasSchedules(date: item.date){
//                    dayDic[item.day] = true
//                }
//            }
//
//            // 日待办
//            if funcType == FuncType.DayTask{
//                let tasks = viewModel.getDayTasks(day: item.date)
//                if tasks.count > 0{
//                    dayDic[item.day] = true
//
//                    var isNotCom = false
//                    var isGiveUp = false
//
//                    for item in tasks {
//                        if !item.is_complete && !item.is_cancel{
//                            isNotCom = true
//                            break
//                        }
//
//                        if item.is_cancel{
//                            isGiveUp = true
//                        }
//                    }
//
//                    if isNotCom{
//                        dayRedDic[item.day] = true
//                    }
//
//                    if isGiveUp{
//                        dayGiveUpDic[item.day] = true
//                    }
//
//                    if !isNotCom && !isGiveUp{
//                        dayGreenDic[item.day] = true
//                    }
//                }
//            }
//
//            // 标签里查看天
//            if funcType == FuncType.TagDay{
//                if tagEntity != nil{
//                    // 有相关时间线或者日待办
//                    if viewModel.IsHasTagBySchedules(date: item.date, tag: tagEntity!) || viewModel.IsHasTagByDayTask(day: item.date, tag: tagEntity!){
//                        dayDic[item.day] = true
//                    }
//                }
//            }
        }
    }

    var body: some View {
        VStack(spacing: 10){
            // MARK: 日期和前后月选择
            HStack(spacing: 20){
                HStack{
                    Text("\(bindingSelectDate.year)")
                        .font(.body.bold())

//                        Text(dateStringArray[1])
//                            .font(.body.bold())
                    Text(bindingSelectDate.month.toMonth())
                        .font(.body.bold())
                }

                Spacer(minLength: 0)

                Image(systemName: "chevron.left")
                    .font(.title3)
//                    .foregroundColor(.theme.primary)
                    .onTapGesture {
//                        HapticManager.instance.impact()
                        updateMonth(delta: -1)
                    }

                Image(systemName: "chevron.right")
                    .font(.title3)
//                    .foregroundColor(.theme.primary)
                    .onTapGesture {
//                        HapticManager.instance.impact()
                        updateMonth(delta: 1)
                    }
            }
            .padding(.horizontal)

            let monthColumns = Array(repeating: GridItem(.flexible()), count: 12)
            LazyVGrid(columns: monthColumns, spacing: 5) {
                // MARK: 月份显示和切换
                ForEach(1..<13) { monthIndex in
                    monthRectangle(monthIndex: monthIndex)
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
            .padding(.horizontal, 3)

            // Dates...
            // Lazy Grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns) {
                ForEach(dateValueArray){value in
                    DayRectangle(value: value)
//                        .background(.red)
//                        .background(
//                            // 选中效果
//                            Capsule()
//                                .fill(Color.theme.primary)
//                                .padding(.horizontal, 8)
//                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 0.3 : 0)
//                        )
                        .onTapGesture {
                            HapticManager.instance.impact()
                            bindingSelectDate = value.date
                        }
                }
            }
            .padding(.horizontal, 3)
        }
        .padding(.vertical)
        .onAppear(perform: {
            updateCheck()
        })
        .onChange(of: bindingSelectDate) { newValue in
            updateCheck()
        }
    }

    // MARK: Day
    @ViewBuilder
    func DayRectangle(value: DateValue) -> some View{
        ZStack{
            if value.day != -1{
                Rectangle()
        //            .fill(Color(hex: colorScheme == .dark ? 0x171B21 : 0xF0F0F0))
                    .fill(Color("GridBG"))
                    .frame(width: DAY_SIZE, height: DAY_SIZE)
                    .cornerRadius(2)
                Text("\(value.day)")
                    .font(.footnote)
            }
//                .foregroundColor(currentMonth == monthIndex ? Color.white : Color.secondary)
        }
//        VStack{
//            if value.day != -1{
//                Text("\(value.day)")
//                    .font(.body)
//                    .fontWeight(Date().isSameDay(date: value.date) ? .bold : .regular)
////                    .foregroundColor(Date().isSameDay(date: value.date) ? .theme.primary : (Date() > value.date ? .primary : .secondary))
//                    .frame(maxWidth: .infinity)
//                    .background(
//                        // 选中效果
//                        Circle()
//                            .fill(Color.primary)
//                            .opacity(value.date.isSameDay(date: selectDate) ? 0.1 : 0)
//                            .frame(width: CHOSE_CIRCLE_SIZE, height: CHOSE_CIRCLE_SIZE)
//                    )
//
//                Spacer()
//
//                if dayDic[value.day] != nil{
//                    // 有数据
//                    Circle()
//                        .fill(dayRedDic[value.day] != nil ? Color.red :
//                                (dayGiveUpDic[value.day] != nil ? Color.gray : (dayGreenDic[value.day] != nil ? Color.green : Color.primary)))
//                        .frame(width: POINT_SIZE, height: POINT_SIZE)
//                }
//            }
//        }
//        .frame(height: 40, alignment: .top)
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

//    @ViewBuilder
    func monthRectangle(monthIndex: Int)-> some View {
        ZStack{
            Rectangle()
    //            .fill(Color(hex: colorScheme == .dark ? 0x171B21 : 0xF0F0F0))
                .fill(bindingSelectDate.month == monthIndex ? Color("GithubGreen") : Color("GridBG"))
                .frame(width: MONTH_SIZE, height: MONTH_SIZE)
                .cornerRadius(2)
            Text("\(monthIndex)")
                .font(.footnote)
                .foregroundColor(bindingSelectDate.month == monthIndex ? Color.white : Color.secondary)
        }
        .onTapGesture {
            HapticManager.instance.soft()
            updateDay(newYear: bindingSelectDate.year, newMonth: monthIndex, newDay: 1)
        }
    }

    func updateDay(newYear: Int, newMonth: Int, newDay: Int){
        bindingSelectDate = getNewDate(newYear: newYear, newMonth: newMonth, newDay: 1)
    }
}

struct TagCalendarContributionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack{
                TagCalendarContributionView(bindingSelectDate: .constant(Date()))
                Spacer()
            }
            .navigationTitle("Test")
        }
    }
}
