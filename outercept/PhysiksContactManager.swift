//
//  PhysiksContactManager.swift
//  outercept
//
//  Created by Bernhard Eiling on 27.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

struct PhysicsBitmask {
    static let none: UInt32 = 0b00
    static let interceptor: UInt32 = 0b01
    static let enemy: UInt32 = 0b10
}

class PhysiksContactManager: NSObject, SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("hitting")
    }
    
}
