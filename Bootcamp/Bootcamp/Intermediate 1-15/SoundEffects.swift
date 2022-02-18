//
//  SoundEffects.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 19.02.2022.
//

import SwiftUI
import AVKit

class SoundManadger {
    static let instance = SoundManadger()
    
    var player: AVAudioPlayer?
    
    enum SoundOption : String {
        case tada
        case badum
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        
        do {
        player = try AVAudioPlayer(contentsOf: url)
        player?.play()
        } catch let error {
            print("error playing sound \(error.localizedDescription)")
        }
        
        
    }
}

struct SoundEffects: View {
    
    var body: some View {
        VStack(spacing: 40) {
            
            Button("Play sound 1") {
                SoundManadger.instance.playSound(sound: .tada)
            }
            
            Button("Play sound 2") {
                SoundManadger.instance.playSound(sound: .badum)
            }
        }
    }
}

struct SoundEffects_Previews: PreviewProvider {
    static var previews: some View {
        SoundEffects()
    }
}
