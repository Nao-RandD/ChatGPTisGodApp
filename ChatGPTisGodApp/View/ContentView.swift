//
//  ContentView.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/05.
//

import SwiftUI
import LicenseList

struct ContentView: View {

    var body: some View {
        NavigationView {
            ZStack {
                Color.primaryColor
                    .ignoresSafeArea()
                VStack {
                    // TODO: ビデオが再生されないため一旦保留
                    //            VideoPlayerUIView()
                    //                .edgesIgnoringSafeArea(.all)
                    MatchedView()
                }
            }
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
