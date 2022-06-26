import Foundation

let DAY_SEC: Int = 60 * 60 * 24
let weekDayStrs: [String] = isChineseZH ?  ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]:
    ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

let itemFormatter: DateFormatter = {
    // Create Date Formatter
    let dateFormatter = DateFormatter()

    // Set Date Format
    dateFormatter.dateFormat = "HH:mm"

    // Convert Date to String
    //    dateFormatter.string(from: date)
    return dateFormatter
}()

func getNewDate(newYear: Int, newMonth: Int, newDay: Int = 1) -> Date{
//    let date = Date()
//    var dateComponents = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
//    dateComponents.day = 1
//    dateComponents.month = newMonth
//    dateComponents.year = newYear
    let curDateCom = DateComponents(year: newYear, month: newMonth, day: 1)
    let newDate = Calendar.current.date(from: curDateCom)!
//    print("newDate:\(newDate) - \(newYear)/\(newMonth)")
    return newDate
}

// STRING
extension Date{
    private var shortFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }

    func asShortDateString() -> String{
        return shortFormatter.string(from: self)
    }
}

extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }

    func toHHmm() -> String {
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "HH:mm"

        // Convert Date to String
        //    dateFormatter.string(from: date)
        return dateFormatter.string(from: self)
    }

    func toString(dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
//        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let dateStr = formatter.string(from: self)
        return dateStr
    }

    func toStringNoSS() -> String {
        return toString(dateFormat: "yyyy-MM-dd HH:mm")
    }

    func toKey(dateFormat:String = "yyyy-MM-dd") -> String {
        return toString(dateFormat: dateFormat)
    }

    func toYMD(dateFormat:String = "yyyy-MM-dd") -> String {
        return toString(dateFormat: dateFormat)
    }

    /*
     "Wed, Oct 30"
     星期三, 10月30号
     */
    func toStringTitleNoYear() -> String {
        return toString(dateFormat: isChineseZH ? "E, MMMd日" : "E, MMM d")
    }

    /*
     星期三, 10月30号 2019
     "Wed, Oct 30 2019"
     */
    func toStringTitle() -> String {
        return toString(dateFormat: isChineseZH ? "E, MMMd日 y年" : "E, MMM d y")
    }

    /*
     2022-6-9 周四
     */
    func toStringYMDW() -> String {
        return toString(dateFormat: "y-M-d E")
    }

    func toStringYMDW2() -> String {
        return toString(dateFormat: "E, y-M-d ")
    }

    func isSameDay(date: Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: date)
    }

    func getTodayDelta() -> Int {
        let sec = Int(self.timeIntervalSince1970 - Date().getDate(hour: self.hour, min: self.min, sec: self.sec).timeIntervalSince1970)
        return sec / DAY_SEC
    }

    func getDay(dayDelta: Int) -> Date{
        return Calendar.current.date(byAdding: .day, value: dayDelta, to: noon)!
    }

    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }

    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }

    var dayWeekBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -7, to: noon)!
    }

    var dayWeekAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 7, to: noon)!
    }

    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var hour: Int {
        return Calendar.current.component(.hour,  from: self)
    }
    var min: Int {
        return Calendar.current.component(.minute,  from: self)
    }
    var sec: Int {
        return Calendar.current.component(.second,  from: self)
    }
    var year: Int {
        return Calendar.current.component(.year,  from: self)
    }
    var dayNumber: Int {
        return Calendar.current.component(.day,  from: self)
    }

    /*
     返回当前日期，除了天，其他都是现在的
     */
    var dateNow: Date{
        let now = Date()
        return self.getDate(hour: now.hour, min: now.min, sec: 0)
    }

    var weekday: Int {
        // The weekday units are the numbers 1 through N (where for the Gregorian calendar N=7 and 1 is Sunday).
        let week = Calendar.current.component(.weekday,  from: self)
        return week == 1 ? 7 : week - 1
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }

    var getZero: Date {
        let zero = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
        return Calendar.current.date(byAdding: .day, value: 0, to: zero)!
    }

    var get24: Date {
        let last = Calendar.current.date(bySettingHour: 23, minute: 59, second:59, of: self)!
        return Calendar.current.date(byAdding: .day, value: 0, to: last)!
    }

    func getDate(hour: Int, min: Int, sec: Int) -> Date {
        let last = Calendar.current.date(bySettingHour: hour, minute: min, second: sec, of: self)!
        return Calendar.current.date(byAdding: .day, value: 0, to: last)!
    }

    func getAllDates() -> [Date]{
        let calendar = Calendar.current

        // getting start date...
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!

        let range = calendar.range(of: .day, in: .month, for: startDate)!
//        range.removeLast()

        // getting date...
        return range.compactMap({ day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        })
    }

//    func isSameWeek(date: Date) -> Bool {
//        Calendar.current.startOfWeek(for: date) == Calendar.current.startOfWeek(for: self)
//    }

    func getWeekDateName() -> String{
        let calendar = Calendar.current
        if let weekday = calendar.dateComponents([.weekday], from: self).weekday {
            //第一天是从周天算起，weekday在 1~7之间
            if weekday > 0 && weekday <= weekDayStrs.count{
                return weekDayStrs[weekday - 1]
            }
        }
        return ""
    }

//    func getWeekDates() -> [Date]{
//        let calendar = Calendar.current
//
//        // getting start date...
//        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
//
//        let range = calendar.range(of: .day, in: .month, for: startDate)!
////        range.removeLast()
//
//        // getting date...
//        return range.compactMap({ day -> Date in
//            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
//        })
//    }
}

//    func getCurrentMonth() -> Date{
//        let calendar = Calendar.current
//
//        // Getting Current Month Date...
//        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonthDelta, to: Date())else{
//            return Date()
//        }
//
//        return currentMonth
//    }

