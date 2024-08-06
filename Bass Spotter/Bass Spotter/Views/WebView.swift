//
//  WebView.swift
//  Bass Spotter
//
//  Created by Phillip on 30.07.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: urlString)
        uiView.load(request)
    }
}
