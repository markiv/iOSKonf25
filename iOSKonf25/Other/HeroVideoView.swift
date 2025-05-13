//
//  HeroVideoView.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 14.05.2025.
//

import AVKit
import SwiftUI

struct HeroVideoView: View {
    var body: some View {
        VStack {
            Image(.ioskonf).resizable().scaledToFit()
                .frame(width: 200)
            Text("iOSKonf25")
        }
        .font(.largeTitle.weight(.black)).fontWidth(.condensed)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            HeroVideoBackground()
        }
    }
}

#Preview {
    HeroVideoView()
}

struct HeroVideoBackground: View {
    let url = Bundle.main.url(forResource: "clouds", withExtension: "mp4")!
    @State private var player: AVQueuePlayer?
    @State private var looper: AVPlayerLooper?

    var body: some View {
        GeometryReader { proxy in
            VideoPlayer(player: player)
                .ignoresSafeArea()
                .disabled(true)
                .frame(width: proxy.size.height * 2, height: proxy.size.height)
                .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
                .onAppear {
                    player = AVQueuePlayer(url: url)
                    if let player {
                        let item = AVPlayerItem(url: url)
                        looper = AVPlayerLooper(player: player, templateItem: item)
                        player.play()
                    }
                }
                .onDisappear {
                    player?.pause()
                }
        }
    }
}
