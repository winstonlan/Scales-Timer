//
//  ViewController.swift
//  Scales Timer
//
//  Created by Winston Lan on 8/4/17.
//  Copyright © 2017 winstonlan. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    //MARK: IBOutlet declarations.
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var pauseResumeButton: UIButton!
    
    //MARK: local variable declaration, and definitions
    var timer = Timer()
    var scale = ScaleTimer()
    var isTimerRunning = false
    var resumeTapped = false
    var onBreak = false


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //MARK: IBActions for Timer Buttons
    @IBAction func startButtonPressed(_ sender: Any) {
        if isTimerRunning == false {
            runTimer()
        }
        
    }
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        if resumeTapped == false {
            timer.invalidate()
            resumeTapped = true
            pauseResumeButton.setTitle("Resume", for: .normal)
        }
        else {
            runTimer()
            resumeTapped = false
            pauseResumeButton.setTitle("Pause", for: .normal)
        }
    }
    @IBAction func resetButtonPressed(_ sender: Any) {
        timer.invalidate()
        scale.resetMinutes()
        scale.resetSeconds()
        updateUI()
        isTimerRunning = false
        
    }
    
    
    @IBAction func breakButtonPressed(_ sender: Any) {
        
    }
    
    //MARK: Update UI Methods
    func updateUI() {
        if scale.currentMinute < 10 {
            minutesLabel.text = "0\(scale.currentMinute)"
        } else {
            minutesLabel.text = "\(scale.currentMinute)"
        }
        
        if scale.currentSecond < 10 {
            secondsLabel.text = "0\(scale.currentSecond)"
        } else {
            secondsLabel.text = "\(scale.currentSecond)"
        }
        
        
    }
    
    
    //MARK: Helper Methods
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerViewController.updateScale)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    func updateScale() {
        if onBreak == false {
            scale.incrementSeconds()
            if scale.currentSecond == 60 {
                scale.incrementMinutes()
            }
        }
        
        else {
            scale.decrementSeconds()
            if scale.currentSecond == -1 {
                scale.decrementMinutes()
                scale.currentSecond = 59
            }
        }
        updateUI()
    }
    
    func startBreak() {
        onBreak = true
        scale.resetSeconds()
        scale.currentMinute = scale.breakEarned
        runTimer()
    }
    
    
}

