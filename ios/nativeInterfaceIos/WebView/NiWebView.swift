//
//  NiWebView.swift
//  nativeInterfaceIos
//
//  Created by N286 on 2023/02/06.
//

import Foundation
import SwiftUI
import WebKit

struct NiWebView: UIViewRepresentable{
    var url = "https://www.google.com";
    
    func makeUIView(context: Context) -> some UIView {
        let userContentController = WKUserContentController()
        for (_, d) in NiWebViewBridge.getDics().enumerated(){
            if let name = d.keys.first {
                userContentController.add(context.coordinator, name: name)
            }
        }
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        
        let webview = WKWebView(frame: .zero, configuration: configuration)
        webview.navigationDelegate = context.coordinator
        webview.evaluateJavaScript("navigator.userAgent"){ res, err in
            let originUserAgent = res as! String
            let agent = originUserAgent + " NiIos"
            webview.customUserAgent = agent
        }
        print(webview.configuration.userContentController.userScripts.count)
        webview.load(URLRequest(url: URL(string: url)!))
        return webview
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandlerWithReply,WKScriptMessageHandler{
        var webView: WKWebView?
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.webView = webView
        }
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage, replyHandler: @escaping (Any?, String?) -> Void) {
            print("----11")
            print(message.body)
            print(message.name)
            replyHandler(1,nil)
        }
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            for (_, d) in NiWebViewBridge.getDics().enumerated(){
                if let k = d.keys.first {
                    if !k.isEmpty && message.name == k{
                        d.values.first!(message.body as! String, webView!)
                    }
                }
            }
        }
    }
}

extension NiWebViewBridge{
    static func getDics() -> [[String: (String, WKWebView)->Void]]{
        Mirror(reflecting: NiWebViewBridge()).children.map{
            [$0.label!:$0.value as! (String, WKWebView)->Void]
        }
    }
}
