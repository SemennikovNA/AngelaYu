//
//  UserPlayer.swift
//  Xylophone
//
//  Created by Nikita on 27.10.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import AVFoundation

class UserPlayer {
    
    var player: AVAudioPlayer?
    
    func play(nameButton: String) {
        
        let url = Bundle.main.url(forResource: nameButton, withExtension: "wav")
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
