//
//  UrlWebView.swift
//
//  Created by kidstyo on 2022/6/26.
//  📝Version: 20220626
//

import SwiftUI
import WebKit

struct WebView: View {
    @Environment(\.openURL) var openURL

    let urlToDisplay: URL
    let displayName: String

    var body: some View {
        UrlWebView(urlToDisplay: urlToDisplay)
//                        .edgesIgnoringSafeArea(.all)
            .navigationBarTitle(LocalizedStringKey(displayName), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        HapticManager.instance.impact()
                        openURL(urlToDisplay)
                    }, label: {
                        Text("浏览器打开")
                            .foregroundColor(Color.secondary)
                    })
                }
            }
    }
}

struct UrlWebView: UIViewRepresentable {
    typealias UIViewType = WKWebView

    var urlToDisplay: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()

        webView.load(URLRequest(url: urlToDisplay))

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {

    }
}
