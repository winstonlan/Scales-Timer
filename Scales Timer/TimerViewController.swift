//
//  ViewController.swift
//  Scales Timer
//
//  Created by Winston Lan on 8/4/17.
//  Copyright © 2017 winstonlan. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    ///////////////////////////////////////////
    
    //MARK: IBOutlet declarations.
    @IBOutlet weak var pauseResumeButton: UIButton!
    @IBOutlet weak var workTimeLabel: UILabel!
    @IBOutlet weak var breakTimeLabel: UILabel!
    @IBOutlet weak var workButtonBackground: UIButton!
    @IBOutlet weak var breakButtonBackground: UIButton!
    
    ///////////////////////////////////////////
    
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
    
    ///////////////////////////////////////////
    
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
    
    ///////////////////////////////////////////
    //MARK: CONTEXT CHANGE IBACTIONS
    
    @IBAction func triggerWorkButtonPressed(_ sender: Any) {
        // Enable the work timer, disable the break timer
        print("Switched to Work Mode")
        if onBreak == true {
            changeToWorkMode()
        }
    }
    
    @IBAction func triggerBreakButtonPressed(_ sender: Any) {
        // Enable to break timer, disable the work timer
        print("Switched to Break Mode")
        if onBreak == false {
            changeToBreakMode()
        }
    }
    
    ///////////////////////////////////////////
    
    //MARK: Update UI Methods
    func updateUI() {
        if onBreak == false {
            workTimeLabel.text = String(format:"%2d:%02d", scale.currentMinute, scale.currentSecond)
        }
        else {
            breakTimeLabel.text = String(format:"%2d:%02d", scale.currentMinute, scale.currentSecond)
        }
//        workTimeLabel.text = String(format:"%2d:%02d", scale.currentMinute, scale.currentSecond)
    }
    
    ///////////////////////////////////////////
    
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
                scale.resetSeconds()
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
    
    func changeToBreakMode() {
        onBreak = true
        timer.invalidate()
        isTimerRunning = false
        scale.resetSeconds()
        scale.currentMinute = 5
        
        breakButtonBackground.backgroundColor = UIColor(red:1.00, green:0.24, blue:0.27, alpha:1.0)
        workButtonBackground.backgroundColor = UIColor(red:0.14, green:0.42, blue:0.69, alpha:1.0)
        
    }
    
    func changeToWorkMode() {
        onBreak = false
        timer.invalidate()
        isTimerRunning = false
        scale.resetMinutes()
        scale.resetSeconds()
        scale.breakEarned = 0
        
        workButtonBackground.backgroundColor = UIColor(red:0.20, green:0.60, blue:1.00, alpha:1.0)
        breakButtonBackground.backgroundColor = UIColor(red:0.70, green:0.24, blue:0.25, alpha:1.0)
        
    }
    
    
    
    
}

