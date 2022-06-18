//
//  DisclosureGroupView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/18.
//

import SwiftUI

struct DisclosureGroupView: View {
    let japanAuthors = ["伊坂幸太郎", "乙一", "東野圭吾", "湊佳苗", "島田莊司", "宮部美幸"]
    let ukAuthors = ["克莉絲蒂", "柯南·道爾", "狄克森·卡爾", "G·K·切斯特頓", "多蘿西·L·塞耶斯", "約瑟芬·鐵伊"]

    var body: some View {
        List{
            DisclosureGroup("日本推理作家") {
                ForEach(japanAuthors, id: \.self) { author in
                    Text(author)
                }
            }
            DisclosureGroup("英國推理作家") {
                ForEach(ukAuthors, id: \.self) { author in
                    Text(author)
                }
            }
            DisclosureGroup("日本推理作家") {
                ForEach(japanAuthors, id: \.self) { author in
                    DisclosureGroup("英國推理作家") {
                        ForEach(ukAuthors, id: \.self) { author in
                            Text(author)
                        }
                    }
                }
            }
        }
    }
}

struct DisclosureGroupView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupView()
    }
}
