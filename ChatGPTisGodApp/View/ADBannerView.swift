//
//  ADBannerView.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/07/06.
//

import Foundation
import GoogleMobileAds
import SwiftUI
import UIKit

struct ADBannerViewControllerRepresentable: UIViewControllerRepresentable {
    // UIViewControllerを作成し、SwiftUIに返す
    func makeUIViewController(context: Context) -> ADBannerViewController {
        return ADBannerViewController()
    }

    // UIViewControllerが更新された場合の処理
    func updateUIViewController(_ uiViewController: ADBannerViewController, context: Context) {
        // 特に何もする必要がない場合は空のままでOK
    }
}

class ADBannerViewController: UIViewController {
    override func viewDidLoad() {
        let bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-2587202478053936/3071858923"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [
                bannerView.widthAnchor.constraint(equalTo: view.widthAnchor),
                bannerView.heightAnchor.constraint(equalTo: view.heightAnchor)
            ])
    }
}
