//
//  MonthContributionView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/23.
//

import SwiftUI

struct MonthContributionView: View {
    @Binding var bindingYear: Int
    @Binding var bindingMonth: Int

    // [monthIndex, Count]
    @Binding var monthCount: [Int: Int]
    let LEVEL: Int

    // MARK: 常量
    let MONTH_SIZE: CGFloat = 25

    var body: some View {
        VStack(spacing: 10){
            // MARK: 日期和前后月选择
            HStack(spacing: 20){
                HStack{
                    Text("\(bindingYear)")
                        .font(.body.bold())

                    Text(bindingMonth.toMonth())
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

            let monthColumns = Array(repeating: GridItem(.flexible()), count: 12)
            LazyVGrid(columns: monthColumns, spacing: 5) {
                // MARK: 月份显示和切换
                ForEach(1..<13) { monthIndex in
                    monthRectangle(monthIndex: monthIndex)
                }
            }
        }
    }

    func updateMonth(delta: Int){
        bindingMonth += delta
        if bindingMonth > 12{
            bindingMonth = 1
            bindingYear += 1
        }

        if bindingMonth < 1{
            bindingMonth = 12
            bindingYear -= 1
        }
    }

//    @ViewBuilder
    func monthRectangle(monthIndex: Int)-> some View {
        ZStack{
            Rectangle()
                .fill(Color("ContributeBackgroud"))
                .frame(width: MONTH_SIZE, height: MONTH_SIZE)
                .cornerRadius(2)

            Rectangle()
                .fill(Color("ContributeForeground"))
                .frame(width: MONTH_SIZE, height: MONTH_SIZE)
                .opacity(getOpacity(count: monthCount[monthIndex] ?? 0, levelSpacing: LEVEL))
                .cornerRadius(2)

            Text("\(monthIndex)")
                .font(.footnote)
                .foregroundColor((monthCount[monthIndex] ?? 0)  > 0 ? .white : .secondary)
        }
        .onTapGesture {
            // MARK: 日期点击
            if (monthCount[monthIndex] ?? 0) > 0
            {
                HapticManager.instance.impact()
            }
            else{
                HapticManager.instance.soft()
            }

            bindingMonth = monthIndex
        }
    }
}

struct MonthContributionView_Previews: PreviewProvider {
    static var previews: some View {
        MonthContributionView(bindingYear: .constant(Date().year), bindingMonth: .constant(Date().month), monthCount: .constant([:]), LEVEL: 2)
            .padding(.horizontal)
    }
}
