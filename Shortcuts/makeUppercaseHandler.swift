//
//  makeUppercaseHandler.swift
//  Shortcuts
//
//  Created by kidstyo on 2022/5/30.
//

import Foundation

class MakeUppercaseHandler: NSObject, MakeUppercaseIntentHandling{
    func handle(intent: MakeUppercaseIntent, completion: @escaping (MakeUppercaseIntentResponse) -> Void) {
        if let inputText = intent.text{
            let uppercaseText = inputText.uppercased()
            completion(MakeUppercaseIntentResponse.success(result: uppercaseText))
        } else{
            completion(MakeUppercaseIntentResponse.failure(error: "The entered text was invalid"))
        }
    }

    func resolveText(for intent: MakeUppercaseIntent, with completion: @escaping (MakeUppercaseTextResolutionResult) -> Void) {
        if let text = intent.text, !text.isEmpty{
            completion(MakeUppercaseTextResolutionResult.success(with: text))
        } else{
            completion(MakeUppercaseTextResolutionResult.unsupported(forReason: .noText))
        }
    }
}
