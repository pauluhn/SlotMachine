//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Paul Uhn on 10/5/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//

import Foundation

class SlotBrain {
    class func computeWinnings (slots: [[Slot]]) -> Int {
        var winnings = 0
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        for slotRow in slots {
            if checkFlush(slotRow) {
                println("flush")
                winnings += 1
                flushWinCount += 1
            }
            if checkThreeInARow(slotRow) {
                println("three in a row")
                winnings += 1
                straightWinCount += 1
            }
        }
        if flushWinCount == 3 {
            println("Royal Flush")
            winnings += 15
        }
        if straightWinCount == 3 {
            println("Epic straight")
            winnings += 1000
        }

        return winnings
    }
    
    class func checkFlush (slotRow: [Slot]) -> Bool {
        var isRedTrue = 0
        var isRedFalse = 0
        
        for slot in slotRow {
            if slot.isRed {
                isRedTrue++
            } else {
                isRedFalse++
            }
        }
        return slotRow.count == isRedTrue || slotRow.count == isRedFalse
    }
    
    class func checkThreeInARow (slotRow: [Slot]) -> Bool {
        var ascending = true
        var descending = true
        
        for var slotNumber = 0; slotNumber < slotRow.count; slotNumber++ {
            if slotRow.first!.value != slotRow[slotNumber].value - slotNumber {
                ascending = false
            }
            if slotRow.first!.value != slotRow[slotNumber].value + slotNumber {
                descending = false
            }
        }
        return ascending || descending
    }
}