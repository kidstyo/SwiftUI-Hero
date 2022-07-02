//
//  TabView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/1.
//

import SwiftUI

struct TabView1: View {
    enum Tab {
          case menu
          case favorites
          case rewards
          case recipes
      }

    @State private var selection: Tab = .menu

    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                //                ScheduleView()
            }
            .tabItem {
                let menuText = Text("账单", comment: "今天做了什么 Schedule")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "list.bullet")
                }.accessibility(label: menuText)
            }
            .tag(Tab.menu)

            NavigationView {
                //                FavoriteSmoothies()
            }
            .tabItem {
                Label {
                    Text("资产",
                         comment: "今天的目标")
                } icon: {
                    Image(systemName: "heart.fill")
                }
            }
            .tag(Tab.favorites)

            NavigationView {
                Text("Shop")
            }
            .tabItem {
                Label {
                    Text("购物车",
                         comment: "Smoothie rewards tab title")
                } icon: {
                    Image(systemName: "seal.fill")
                }
            }
            .tag(Tab.rewards)

            NavigationView {
                //                MineView()
                // TODO What it is?
                //                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .tabItem {
                Label {
                    Text("我的物品",
                         comment: "Smoothie recipes tab title")
                } icon: {
                    Image(systemName: "book.closed.fill")
                }
            }
            .tag(Tab.recipes)
        }
    }
}

struct TabView1_Previews: PreviewProvider {
    static var previews: some View {
        TabView1()
    }
}
