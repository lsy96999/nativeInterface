//
//  WebView.swift
//  nativeInterfaceIos
//
//  Created by N286 on 2023/02/06.
//

import SwiftUI

struct WebView: View {
    var body: some View {
        VStack{
            NiWebView()
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
