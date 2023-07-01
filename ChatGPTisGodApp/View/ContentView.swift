//
//  ContentView.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/05.
//

import SwiftUI

struct ContentView: View {
    @State var isShowNavigationBar = true
    @Namespace var namespace

    var body: some View {
        NavigationView {
            ZStack {
                Color.primaryColor
                    .ignoresSafeArea()
                // TODO: ビデオが再生されないため一旦保留
                //            VideoPlayerUIView()
                //                .edgesIgnoringSafeArea(.all)
                MatchedView(isShowNavigationBar: $isShowNavigationBar)
                if isShowNavigationBar {
                    VStack {}
                        .navigationBarTitle(Text("神へのお悩み相談室"))
                        .navigationBarItems(
                            trailing:
                                NavigationLink(
                                    destination:  AppInfoView(),
                                    label: {
                                        Image(systemName: "info.square.fill")
                                            .foregroundColor(.accentColor)
                                            .frame(width: 50, height: 50)
                                    }
                                ))
                } else {
                    VStack {}
                        .navigationBarTitle(Text(""))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
