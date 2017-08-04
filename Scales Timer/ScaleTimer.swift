//
//  Timer.swift
//  Scales Timer
//
//  Created by Winston Lan on 8/4/17.
//  Copyright © 2017 winstonlan. All rights reserved.
//

import Foundation

class ScaleTimer {
    var currentSecond : Int = 0
    var currentMinute : Int = 0
    var breakEarned : Int = 1
    
    func incrementSeconds() {
        currentSecond += 1
    }
    
    func incrementMinutes() {
        currentMinute += 1
        resetSeconds()
    }
    
    func addBreak(amount: Int) {
        breakEarned += amount
    }
    
    func resetSeconds() {
        currentSecond = 0
    }
    
    func resetMinutes() {
        currentMinute = 0
    }
    
    func resetBreak() {
        breakEarned = 0
    }
    
    func decrementSeconds() {
        currentSecond -= 1
        
    }
    
    func decrementMinutes() {
        currentMinute -= 1
    }
}
