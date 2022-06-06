//
//  Today3x3View.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/5.
//

import SwiftUI

struct Today3x3View: View {
    var body: some View {
        List{
            if !ProcessInfo.processInfo.isiOSAppOnMac{
                // Mac上会崩溃
                HStack{
                    Image(systemName: "hands.sparkles")
                    VStack(alignment: .leading){
                        Link(LocalizedStringKey("五星好评"), destination: URL(string: "itms-apps://itunes.apple.com/app/id1603963061?action=write-review")!)
                        Text("这对3x3很有帮助!!！👏")
                            .font(.footnote)
                            .foregroundColor(Color.secondary)
                    }
                }
            }

            HStack{
                Image(systemName: "mail")
                Link(LocalizedStringKey("邮件反馈"), destination: URL(string: "mailto:kidstyo@foxmail.com")!)

                Spacer()
            }
        }
    }
}

struct Today3x3View_Previews: PreviewProvider {
    static var previews: some View {
        Today3x3View()
    }
}
