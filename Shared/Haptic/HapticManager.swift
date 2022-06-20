//
//  HapticManager.swift
//  Today_3x3
//
//  Created by kidstyo on 2021/12/26.
//

import UIKit

class HapticManager{
    static let instance = HapticManager()

    func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }

    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }

    func suc(){
        notification(type: UINotificationFeedbackGenerator.FeedbackType.success)
    }

    func error(){
        notification(type: UINotificationFeedbackGenerator.FeedbackType.error)
    }

    func impact(){
        impact(style: .medium)
    }

    func dragSort(){
        impact(style: .medium)
    }

    func soft(){
        impact(style: .soft)
    }
}
