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
            Section(header: Text(LocalizedStringKey("反馈"))){
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
        }
    }
}

struct Today3x3View_Previews: PreviewProvider {
    static var previews: some View {
        Today3x3View()
    }
}
