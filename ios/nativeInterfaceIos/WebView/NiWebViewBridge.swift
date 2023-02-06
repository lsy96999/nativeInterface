//
//  NiWebViewBridge.swift
//  nativeInterfaceIos
//
//  Created by N286 on 2023/02/06.
//

import Foundation
import WebKit

struct NiWebViewBridge{
    let test = { (body: String, webview: WKWebView) in
        webview.evaluateJavaScript("javascript:test(1)")
    }
    
    let test2 = { (body: String, webview: WKWebView) in
        webview.evaluateJavaScript("javascript:test(2)")
    }
}
