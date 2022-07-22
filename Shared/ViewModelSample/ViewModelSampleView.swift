//
//  ViewModelSampleView.swift
//  SwiftUI-Hero (iOS)
//
//  Created by kidstyo on 2022/7/19.
//

import SwiftUI

//public class ViewModelSample: ObservableObject {
public class ViewModelSample: ObservableObject {
    /// A singleton to use
    public static let shared = ViewModelSample()

    @Published var Count: Int = 0

    func addCount() {
        Count += 1
    }
}

struct ViewModelSampleItemView: View {
    @ObservedObject var viewModel = ViewModelSample.shared

    var body: some View {
        VStack{
            Text("Hello, Item! \(ViewModelSample.shared.Count)")
            Button {
                ViewModelSample.shared.addCount()
            } label: {
                Text("shared + Count")
            }

//            Button {
//                viewModel.addCount()
//            } label: {
//                Text("viewModel + Count")
//            }
        }
    }
}

struct ViewModelSampleView: View {
    // 这个必须加或者App里初始化，然后下面的继续使用就没问题
    @ObservedObject var viewModel = ViewModelSample.shared

    var body: some View {
        VStack{
            Text("Hello, World! \(ViewModelSample.shared.Count)")
            Button {
                ViewModelSample.shared.addCount()
            } label: {
                Text("shared + Count")
            }

            Divider()

            ViewModelSampleItemView()

//            Button {
//                viewModel.addCount()
//            } label: {
//                Text("viewModel + Count")
//            }
        }
        .onChange(of: ViewModelSample.shared.Count) { newValue in
            print("\(newValue)")
        }
    }
}

struct ViewModelSampleView_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelSampleView()
    }
}
