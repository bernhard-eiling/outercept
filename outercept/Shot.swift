//
//  Shot.swift
//  outercept
//
//  Created by Bernhard Eiling on 01.09.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class ShotNode: SKSpriteNode {
    
    private var shotPhysicsBody: SKPhysicsBody {
        let physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        physicsBody.categoryBitMask = PhysicsBitmask.shot
        physicsBody.contactTestBitMask = PhysicsBitmask.enemy
        physicsBody.collisionBitMask = PhysicsBitmask.none
        physicsBody.isDynamic = true
        return physicsBody
    }
    
    init() {
        let size = CGSize(width: 3, height: 3)
        super.init(texture: nil, color: UIColor.orange, size: size)
        name = "shot"
        physicsBody = shotPhysicsBody
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
