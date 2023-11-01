//
//  SoundPlay.swift
//  Xylophone
//
//  Created by Nikita on 28.10.2023.
//

import Foundation
import AVFoundation

class Player {
    
    //MARK: - Properties
    
    var player: AVAudioPlayer?
    
    init(player: AVAudioPlayer? = nil) {
        self.player = player
    }
    
    // MARK: - Methods
    
    func play(nameButton: String) {
        
        guard let url = Bundle.main.url(forResource: nameButton, withExtension: "wav") else {
            print("Url not found")
            return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
        } catch let error {
            print(error.localizedDescription)
        }
        player?.play()
    }
    
}

