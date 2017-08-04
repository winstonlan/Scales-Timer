//
//  Timer.swift
//  Scales Timer
//
//  Created by Winston Lan on 8/4/17.
//  Copyright © 2017 winstonlan. All rights reserved.
//

import Foundation

class Stopwatch {
    var currentSecond : Int = 0
    var currentMinute : Int = 0
    
    func incrementSeconds() {
        currentSecond += 1
    }
    
    func incrementMinutes() {
        currentMinute += 1
        resetSeconds()
    }
    
    func resetSeconds() {
        currentSecond = 0
    }
    
    func resetMinutes() {
        currentMinute = 0
    }
}
