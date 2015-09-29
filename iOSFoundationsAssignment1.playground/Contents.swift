//: Playground - noun: a place where people can play

import UIKit


// REMINDER: THIS HOMEWORK IS NOT DUE UNTIL HALFWAY THROUGH THE COURSE.
//	Create a playground file with the following functionality:

// Create a base Stick class with properties/methods that all of your other Stick classes will need

class Stick {
    
    var broken = false
    
    var length: Int
    var width: Int
    var weight: Int
    var numberofShakes = 5
    
    var attackDamage = 5
    
    
    func shake() {
        print("shaking")
        broken = false
        numberofShakes = 10
    }
    
    func breakStick() {
        print("breaking")
        broken = true
        length = length/2
    }
    
    func sizeOfStick() ->Int {
        return width * length
    }
    
    func weightOfStick() ->Int {
        return weight
    }
    
    
    init (startingLength: Int, startingWidth: Int, startingWeight: Int) {
        length = startingLength
        width = startingWidth
        weight = startingWeight
    }
    
}


// Create 5 different Stick classes that are a subclass of your Stick base class. Each subclass should have its own unique property and method (like my takeSelfie method in my SelfieStick class)


class SelfieStick: Stick {
    
    var colorOfStick = "black"
    
    func takeSelfie() {
        print("Taking picture")
    }
    
    init(colorStick : String) {50
        super.init(startingLength: 50, startingWidth: 50, startingWeight: 50)
        colorOfStick = colorStick
    }
    
}


class ChopStick : Stick {
    
    var pickUpFood = false
    var setUpDownFood = false
    
    func feed() {
        pickUpFood = true
    }
    
    func finish() {
        pickUpFood = false
    }
    
    init(initFeeding: Bool) {
        super.init(startingLength: 50, startingWidth: 50, startingWeight: 50)
        pickUpFood = initFeeding
        
    }
    
}


class GlowStick : Stick {
    
    var glow = false
    
    func makeStickGlow() {
        glow = true
    }
    
    func makeStickNotGlow() {
        glow = false
    }
    
    init(glowing : Bool) {
        super.init(startingLength:50, startingWidth:50, startingWeight:50)
        glow = glowing
    }
    
}


class LipStick: Stick {
    
    var lipStickColor = "red"
    var wipe = false
    
    func applyLipStick() {
        print("putting on lipStick")
        wipe = false
        
    }
    
    func removeLipStick() {
        print("Removing lipstick")
        wipe = true
    }
    
    init(stickColor : String) {
        super.init(startingLength: 50, startingWidth: 50, startingWeight: 50)
        lipStickColor = stickColor
    }
    
}

class DrumStick: Stick {
    
    var stickType = "Mezzo 2 Multi Rod"
    var pound = false
    
    func poundStick() {
        pound = true
    }
    
    init (typeofStick: String) {
      super.init(startingLength: 50, startingWidth: 50, startingWeight: 50)
       stickType = typeofStick
    }
    
}
    



// Create 1 more Stick class, which must be a subclass of a subclass of your Stick base class


class ChapStick: LipStick {
    
    
    var smackLipstick = false
    
    func smackLips() {
        smackLipstick = true
    }

    
    init(smackLips : Bool) {
        super.init(stickColor: "clear")
        smackLipstick = smackLips
    }
    
}



// Challenge: Create a way for one stick to break another stick in half (IE reduce its length by half, remember the function-verb variable-noun technique!!)

let bigStick = Stick(startingLength: 50, startingWidth: 10, startingWeight: 10)
bigStick.breakStick()
