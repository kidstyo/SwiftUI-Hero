//
//  ProTaskItemView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/7.
//

import SwiftUI

struct ProTaskItemView: View {
    @Environment(\.colorScheme) private var colorScheme
    @AppStorage(THEME_STORAGE_KEY, store: UserDefaults(suiteName: GROUP_ID)) var appTheme: Theme = .classic
    @AppStorage(PRO_COLOR_LIGHT_STORAGE_KEY, store: UserDefaults(suiteName: GROUP_ID)) var proLightColor: Color = Theme.orange.mainColor
    @AppStorage(PRO_COLOR_DARK_STORAGE_KEY, store: UserDefaults(suiteName: GROUP_ID)) var proDarkColor: Color = Theme.orange.mainColor

    let RADIUS: CGFloat = 20
    let CORNER_RADIUS: CGFloat = 10

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading){
                Rectangle()
                    .fill(Color.secondary.opacity(0.3))

                let proTaskPercent: CGFloat = 0.5
                Rectangle()
                    .fill(appTheme == .custom ? (colorScheme == .dark ? proDarkColor : proLightColor) : appTheme.mainColor.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .frame(width: min(1, max(0, proTaskPercent)) * proxy.size.width)

                HStack{
                    Text("Text")
                        .foregroundColor(Color.white)
                        .padding(.leading, 5)

//                    taskThingView
//                        .padding(.leading, 5)
                    Spacer()
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: CORNER_RADIUS, style: .continuous))
            // 否则外面滑动 tab无效
//            .allowsHitTesting(isShowPreview)
//            .gesture(DragGesture().onChanged({ (value) in
//                var offset = value.location.x
//                if offset < 0{
//                    offset = 0
//                }
//
//                let maxWidth = proxy.size.width - RADIUS * 2
//                if offset > maxWidth{
//                    offset = maxWidth
//                }
//
//                // MARK: 进度条拖拽
//                // 进度目标 可能是0
//                if item.pro_task_type == ProTaskType.pro_progress.rawValue{
//                    let max = Float(item.pro_task_max)
//                    if max > 0 {
//                        let lastCurrent = item.pro_task_current
//                        let current = Int32(Float(offset / maxWidth) * max)
//                        item.pro_task_current = current
//
//                        if lastCurrent != current{
//                            HapticManager.instance.impact(style: .light)
//                        }
//
//                        withAnimation {
//                            proTaskPercent = CGFloat(Float(current) / max)
//                        }
//                    }
//                }
//                else if item.pro_task_type == ProTaskType.pro_progress_revert.rawValue{
//                    let max = Float(item.pro_task_max)
//                    let origin = Float(item.pro_task_origin)
//                    let targetDelta = origin - max
//                    if targetDelta > 0 {
//                        let lastCurrent = item.pro_task_current
//                        let siderPer = Float(offset / maxWidth)
//
//                        // 30斤
//                        let sliderDelta = Int32(siderPer * targetDelta)
//                        //
//                        let current = Int32(origin) - sliderDelta
//                        item.pro_task_current = current
//
//                        if lastCurrent != current{
//                            HapticManager.instance.impact(style: .light)
//                        }
//
//                        let currentDelta = origin - Float(current)
//                        withAnimation {
//                            proTaskPercent = CGFloat(Float(currentDelta) / targetDelta)
//                        }
//                    }
//                }
//            }).onEnded({ (value) in
//                onProTaskDragEnd()
//            }))
        }
        .frame(height: RADIUS * 2)
    }
}

struct ProTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProTaskItemView()
    }
}
