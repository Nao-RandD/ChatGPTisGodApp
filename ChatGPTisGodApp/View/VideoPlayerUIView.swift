//
//  VideoPlayerUIView.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/19.
//

import AVKit
import SwiftUI

struct VideoPlayerUIView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false

        let parentView = UIView()
        parentView.addSubview(view)
        parentView.addConstraints([
            view.widthAnchor.constraint(equalTo: parentView.widthAnchor),
            view.heightAnchor.constraint(equalTo: parentView.heightAnchor)
        ])

        // 動画ファイルのURLを取得
        guard let videoURL = Bundle.main.url(forResource: "BackgroundVideo", withExtension: "mp4") else {
            print("🍻: File not found")
            return UIView()
        }
        // AVPalyerを含むUIViewを作成
        let player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)

        player.play()

        // ループ再生するように設定
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
            player.seek(to: .zero)
            player.play()
        }

        return parentView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        // とりあえず空

    }
}

struct VideoPlayerUIView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerUIView()
    }
}
