//
//  Enemy.swift
//  outercept
//
//  Created by Bernhard Eiling on 25.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class EnemyNode: SKSpriteNode {
    
    init() {
        let size = CGSize(width: 30, height: 30)
        super.init(texture: nil, color: UIColor.red, size: size)
        physicsBody = SKPhysicsBody(circleOfRadius: 15)
        physicsBody?.categoryBitMask = PhysicsBitmask.enemy
        physicsBody?.contactTestBitMask = PhysicsBitmask.interceptor
        physicsBody?.collisionBitMask = PhysicsBitmask.none

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
