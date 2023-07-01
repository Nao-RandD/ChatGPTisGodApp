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
        termOfUseURL: URL(string: "https://nao-randd.github.io/ChatGPTisGodApp/"),
        appURL: URL(string: "https://apps.apple.com/jp/app/ai%E3%81%8A%E6%82%A9%E3%81%BF%E7%9B%B8%E8%AB%87/id6446774783")!,
        developerInfoURL: URL(string: "https://twitter.com/Nao_RandD"),
        appStoreID: "6446774783"
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
