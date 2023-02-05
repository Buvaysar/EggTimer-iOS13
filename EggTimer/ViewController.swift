//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var doneLabel: UILabel!
    let eggTimes = ["Soft": 5*60, "Medium": 7*60, "Hard": 12*60]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    @IBAction func hardnessSelected(_ sender: UIButton) {
        playSound(soundName: "alarm_sound")

        func playSound(soundName: String) {
            
    }
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        doneLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float (secondsPassed) / Float (totalTime)
            progressBar.progress = percentageProgress

           
            
        }
        else {
            timer.invalidate()
        doneLabel.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            progressBar.progress = 1.0
      

}
}
}
