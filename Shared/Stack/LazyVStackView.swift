//
//  LazyVStackView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/7.
//

import SwiftUI

struct LazyVStackView: View {
    struct DayView: View {
        let month: Int
        let day: Int

        var body: some View {
            VStack {
                Image(systemName: "calendar.circle")
                Text("\(month)/\(day)")
            }
        }
    }

    var monthDic = [
        "5": 31,
        "6": 30
    ]

    var body: some View {
        ScrollView{
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(5..<7) { (month) in
                        Section(header: Text("\(month)月"), footer: Text("\(monthDic["\(month)"]!)天")) {
                            ForEach(1..<monthDic["\(month)"]! + 1) { (day)  in
                                DayView(month: month, day: day)
                            }
                        }
                    }

                }
            }
            .frame(height: 300)

            ScrollView(.vertical) {
                LazyVStack(pinnedViews: [.sectionHeaders, .sectionFooters]) {
                    ForEach(5..<7) { (month) in
                        Section(header: Text("\(month)月")
                                    .background(Color.yellow), footer: Text("\(monthDic["\(month)"]!)天")) {
                            ForEach(1..<monthDic["\(month)"]!+1) { (day)  in
                                DayView(month: month, day: day)
                            }
                        }
                    }

                }
            }
            .frame(height: 300)
        }
    }
}

struct LazyVStackView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStackView()
    }
}
