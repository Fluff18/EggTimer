//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 5]
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        if let result = eggTime[hardness] {
            var time = result
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if time > 0 {
                    print("\(time) seconds")
                    time -= 1
                    self.progressBar.progress = Float((result-time)/result)
                } else {
                    Timer.invalidate()
                    self.TitleLabel.text = "DONE"
                }
            }
        }
        
    }
    
}
