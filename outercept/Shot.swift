//
//  Shot.swift
//  outercept
//
//  Created by Bernhard Eiling on 01.09.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class ShotNode: SKSpriteNode {
    
    let damage = 1
    let gunship: Gunship
    
    private var shotPhysicsBody: SKPhysicsBody {
        let physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        physicsBody.categoryBitMask = PhysicsBitmask.shot
        physicsBody.contactTestBitMask = PhysicsBitmask.enemy
        physicsBody.collisionBitMask = PhysicsBitmask.none
        physicsBody.isDynamic = true
        return physicsBody
    }
    
    init(withGunship ship: Gunship, andLifetime lifetime: Double) {
        let size = CGSize(width: 10, height: 1)
        gunship = ship
        super.init(texture: nil, color: UIColor.orange, size: size)
        name = "shot"
        physicsBody = shotPhysicsBody
        let removeAction = SKAction.sequence([
            SKAction.wait(forDuration: lifetime),
            SKAction.removeFromParent()
            ])
        run(removeAction)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
