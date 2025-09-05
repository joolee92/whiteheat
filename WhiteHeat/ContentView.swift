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
    var body: some View {
        HStack {
            Button("Play"){
                if let url = Bundle.main.url(forResource: "swimming_in_the_dark", withExtension: "wav") {
                    do {
                        player = try AVAudioPlayer(contentsOf: url)
                        player?.play()
                    } catch {
                        print("Error playing audio")
                    }
                }
            }
            Button("Pause"){
                if ((player?.isPlaying) != nil) {
                    player?.pause()
                }
            }
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    ContentView()
}
