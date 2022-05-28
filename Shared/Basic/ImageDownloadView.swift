//
//  DownloadView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/5/28.
//

import SwiftUI

struct ImageDownloadView: View {
    @State private var remoteImage: UIImage? = nil
    let placeholderOne = UIImage(named: "Owen Pomery Light")

    let httpsURL = "https://wx4.sinaimg.cn/mw2000/006R0ZyYgy1h1qafi1702j31o024wkjl.jpg"

    let httpURL = "http://hdjc8.com/images/logo.png"

    var body: some View {
        Image(uiImage: self.remoteImage ?? placeholderOne!)
            .resizable()
            .scaledToFit()
            .onAppear(perform: fetchRemoteImage)
    }

    func fetchRemoteImage(){
        // 图片网址http的话，需要修改属性配置文件
        // Info
        // App Transport Security Settings
        // 子键 + Allow Arbitrary Loads 允许非https的图片加载 Bool 为 YES
        guard let url = URL(string: httpsURL) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let image = UIImage(data: data!){
                self.remoteImage = image
            }
            else{
                print(error ?? "")
            }
        }
        // 执行，开始下载
        .resume()
    }
}

struct ImageDownloadView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDownloadView()
    }
}
