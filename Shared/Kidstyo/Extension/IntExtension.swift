//
//  Int.swift
//  Today_3x3
//
//  Created by kidstyo on 2022/1/23.
//

import Foundation

extension Int{
    func toMonth() -> String {
//        print(Locale.current.identifier)
//        print(Locale.current.languageCode)

        if isChineseZH{
            return "\(self)月"
        }

        if self == 1{
            return "January"
        }

        if self == 2{
            return "February"
        }

        if self == 3{
            return "March"
        }

        if self == 4{
            return "April"
        }

        if self == 5{
            return "May"
        }

        if self == 6{
            return "June"
        }

        if self == 7{
            return "July"
        }

        if self == 8{
            return "August"
        }

        if self == 9{
            return "September"
        }

        if self == 10{
            return "October"
        }

        if self == 11{
            return "November"
        }

        if self == 12{
            return "December"
        }

        return "\(self)月"
    }
}
