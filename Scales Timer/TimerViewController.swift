//
//  ViewController.swift
//  Scales Timer
//
//  Created by Winston Lan on 8/4/17.
//  Copyright © 2017 winstonlan. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    
    var timer = Timer()
    var stopWatch = Stopwatch()
    var isTimerRunning = false


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //MARK: IBActions for Timer Buttons
    @IBAction func startButtonPressed(_ sender: Any) {
        runTimer()
    }
    
    
    //MARK: Update UI Methods
    func updateMinutesAndSeconds() {
        if stopWatch.currentMinute < 10 {
            minutesLabel.text = "0\(stopWatch.currentMinute)"
        } else {
            minutesLabel.text = "\(stopWatch.currentMinute)"
        }
        
        if stopWatch.currentSecond < 10 {
            secondsLabel.text = "0\(stopWatch.currentSecond)"
        } else {
            secondsLabel.text = "\(stopWatch.currentSecond)"
        }
    }
    
    
    //MARK: Helper Methods
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerViewController.updateStopWatch)), userInfo: nil, repeats: true)
    }
    
    func updateStopWatch() {
        stopWatch.incrementSeconds()
        if stopWatch.currentSecond == 60 {
            stopWatch.incrementMinutes()
        }
        
        updateMinutesAndSeconds()
    }
    
    
}

