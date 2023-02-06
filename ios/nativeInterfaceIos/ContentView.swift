//
//  ContentView.swift
//  nativeInterfaceIos
//
//  Created by N286 on 2023/02/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination: WebView()){
                Text("go webview")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
