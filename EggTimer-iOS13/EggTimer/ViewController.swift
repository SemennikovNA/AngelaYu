//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: - IB Outlet's
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var progressLine: UIProgressView!
    @IBOutlet weak var stopButton: UIButton!
    
    //MARK: - Properties
    
    var player: AVAudioPlayer!
    var timer: Timer!
    let eggsTime: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 720] // 300 секунд
    var totalTime = 0
    var secondsPassed = 0
    /// Custom colors
    let backColor = UIColor(red: 97 / 255, green: 163 / 255, blue: 186 / 255, alpha: 1)
    let textColor = UIColor(red: 221 / 255, green: 221 / 255, blue: 221 / 255, alpha: 1)
    let lightGreenColor = UIColor(red: 210 / 255, green: 222 / 255, blue: 50 / 255, alpha: 1)
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureUIElements()
    }
    
    //MARK: - IB Action's
    
    @IBAction func eggsButtons(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        player?.stop()
        progressLine.progress = 0.0
        secondsPassed = 0
        textLabel.text = title
        let eggs = eggsTime[title]!
        totalTime = eggs
        timer(value: totalTime)
        stopButton.isEnabled = true
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        progressLine.progress = 0.0
        player?.stop()
        textLabel.text = "How do you like your eggs?"
        stopButton.isEnabled = false
    }
    
    
    //MARK: - Private methods
    
    private func cofigureUIElements() {
        ///View
        view.backgroundColor = backColor
        
        ///Text label's
        textLabel.textColor = textColor
        textLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        ///Progress indicator
        progressLine.progressTintColor = lightGreenColor
        progressLine.trackTintColor = textColor
        
        ///Button
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(textColor, for: .normal)
        stopButton.isEnabled = false
    }
    
    private func timer(value: Int) {
        let  value = value
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { Timer in
            if self.secondsPassed < value {
                self.secondsPassed += 1
                self.progressLine.progress = Float(self.secondsPassed) / Float(value)
            } else {
                Timer.invalidate()
                self.textLabel.text = "Done!"
                self.playSound()
            }
        }
    }
    
    private func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else {
            print("Url not found")
            return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
