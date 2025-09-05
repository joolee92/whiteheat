//
//  ContentView.swift
//  WhiteHeat
//
//  Created by Joo Lee on 9/5/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var player: AVAudioPlayer?
    var url = Bundle.main.url(forResource: "swimming_in_the_dark", withExtension: "wav")
    var body: some View {
        HStack {
            Button("Play") {
                if let player = player {
                    if !player.isPlaying {
                        player.play()
                    }
                } else {
                    do {
                        player = try AVAudioPlayer(contentsOf: url!)
                        player?.prepareToPlay()
                        player?.play()
                    } catch {
                        print("Error playing audio: \(error.localizedDescription)")
                    }
                }
            }
            Button("Pause") {
                if let player = player, player.isPlaying {
                    player.pause()
                }
            }
        }
        .buttonStyle(.bordered)
    }
}



#Preview {
    ContentView()
}
