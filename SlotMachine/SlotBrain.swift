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
        }
        if flushWinCount == 3 {
            println("Royal Flush")
            winnings += 15
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
}