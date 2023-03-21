//
//  AppInfoView.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/21.
//

import SwiftUI
import AppInfoList

struct AppInfoView: View {
    let info = AppInfo(
        termOfUseURL: URL(string: "https://www.nao-randd.info/policy"),
//        appURL: URL(string: "https://apps.apple.com/jp/app/ez-pomo/id1668609447?l=ja")!,
           developerInfoURL: URL(string: "https://twitter.com/Nao_RandD")!
//           appStoreID: "1668609447"
        )
    let fileURL = Bundle.main.url(forResource: "license-list", withExtension: "plist")!

    var body: some View {
        AppInfoListView(info: info, licenseFileURL: fileURL)
    }
}

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
    }
}
