//
//  VStackView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/24.
//

import SwiftUI

struct VStackView: View {
    var body: some View {
        ScrollView{
            VStack{
                ForEach(0..<8){ i in
                    HStack{
                        Text("\(i)")
                        Spacer()
                    }
                    .border(.green, width: 1)
                }
            }
            .border(.green, width: 1)

            VStack(spacing: 0){
                ForEach(0..<8){ i in
                    HStack{
                        Text("\(i)")
                        Spacer()
                    }
                    .border(.blue, width: 1)
                }
            }
            .border(.blue, width: 1)

            VStack(spacing: 10){
                ForEach(0..<8){ i in
                    HStack{
                        Text("\(i)")
                        Spacer()
                    }
                    .border(.red, width: 1)
                }
            }
            .border(.red, width: 1)
        }
    }
}

struct VStackView_Previews: PreviewProvider {
    static var previews: some View {
        VStackView()
            .previewDevice("iPhone 13 Pro")
    }
}
