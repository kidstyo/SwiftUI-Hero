//
//  MyCalendarView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/19.
//

import SwiftUI

// DateValue Model...
struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}

struct MyCalendarView: View {
    @Binding var selectDate: Date
//    @EnvironmentObject var viewModel: AppViewModel

//    let funcType: FuncType

    // Month update on arrow button clicks...
    @State var currentYear: Int = Date().year
    @State var currentMonth: Int = Date().month
    @State var newMonthDate: Date = Date()

    @State var dayDic : [Int : Bool] = [:]

    // 全部完成/数据正常
    @State var dayGreenDic : [Int : Bool] = [:]

    // 未完成/数据有问题
    @State var dayRedDic : [Int : Bool] = [:]

    // 有放弃的，优先级低于未完成
    @State var dayGiveUpDic : [Int : Bool] = [:]

    @State var dateValueArray : [DateValue] = []
    @State var dateStringArray : [String] = []
//    @State var tagEntity: TagEntity? = nil

    // 选中的显示大小
    let CHOSE_CIRCLE_SIZE: CGFloat = 32
    let POINT_SIZE: CGFloat = 6

    func updateCheck(){
        print("updateCheck:\(currentYear)-\(currentMonth)")
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
            // Days
            HStack(spacing: 20){
                HStack{
                    if dateStringArray.count > 1{
                        Text(dateStringArray[0])
                            .font(.body.bold())

                        Text(dateStringArray[1])
                            .font(.body.bold())
                    }
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

            // Day View...
            HStack(spacing: 0){
                ForEach(weekDayStrs, id: \.self){day in
                    Text(day)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity)
                }
            }

            // Dates...
            // Lazy Grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(dateValueArray){value in
                    CardView(value: value)
//                        .background(.red)
//                        .background(
//                            // 选中效果
//                            Capsule()
//                                .fill(Color.theme.primary)
//                                .padding(.horizontal, 8)
//                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 0.3 : 0)
//                        )
                        .onTapGesture {
//                            HapticManager.instance.impact()
                            selectDate = value.date
                        }
                }
            }
        }
        .padding(.vertical)
        .onAppear(perform: {
            // 初始化
            currentYear = selectDate.year
            currentMonth = selectDate.month
            updateCheck()
        })
        .onChange(of: currentYear) { newValue in
            updateCheck()
        }
        .onChange(of: currentMonth) { newValue in
            updateCheck()
        }
//        .onChange(of: viewModel.todayState) { newValue in
//            // 监听任务变化 TODO 优化
//            updateCheck()
//        }
//        .onChange(of: viewModel.weekState) { newValue in
//            // 监听任务变化 TODO 优化
//            updateCheck()
//        }
        .onChange(of: selectDate) { newValue in
            // 监听日期变更
            currentYear = selectDate.year
            currentMonth = selectDate.month
            updateCheck()
        }
    }

    @ViewBuilder
    func CardView(value: DateValue) -> some View{
        VStack{
            if value.day != -1{
                Text("\(value.day)")
                    .font(.body)
                    .fontWeight(Date().isSameDay(date: value.date) ? .bold : .regular)
//                    .foregroundColor(Date().isSameDay(date: value.date) ? .theme.primary : (Date() > value.date ? .primary : .secondary))
                    .frame(maxWidth: .infinity)
                    .background(
                        // 选中效果
                        Circle()
                            .fill(Color.primary)
                            .opacity(value.date.isSameDay(date: selectDate) ? 0.1 : 0)
                            .frame(width: CHOSE_CIRCLE_SIZE, height: CHOSE_CIRCLE_SIZE)
                    )

                Spacer()

                if dayDic[value.day] != nil{
                    // 有数据
                    Circle()
                        .fill(dayRedDic[value.day] != nil ? Color.red :
                                (dayGiveUpDic[value.day] != nil ? Color.gray : (dayGreenDic[value.day] != nil ? Color.green : Color.primary)))
                        .frame(width: POINT_SIZE, height: POINT_SIZE)
                }
            }
        }
        .padding(.top, 6)
        .frame(height: 40, alignment: .top)
    }

    func updateMonth(delta: Int){
        currentMonth += delta
        if currentMonth > 12{
            currentMonth = 1
            currentYear += 1
        }

        if currentMonth < 1{
            currentMonth = 12
            currentYear -= 1
        }
    }

    func extractDate() -> [DateValue]{
        let calendar = Calendar.current

        // Getting Current Month Date...
        newMonthDate = getNewDate(newYear: currentYear, newMonth: currentMonth)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MMMM"

        let date = formatter.string(from: newMonthDate)
        dateStringArray = date.components(separatedBy: " ")

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
}

struct MyCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MyCalendarView(selectDate: .constant(Date()))
    }
}
