//
//  Interceptor.swift
//  outercept
//
//  Created by Bernhard Eiling on 21.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class InterceptorNode: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "Spaceship")
        let size = CGSize(width: 30, height: 30)
        super.init(texture: texture, color: UIColor.blue, size: size)
        physicsBody = SKPhysicsBody(circleOfRadius: 15)
        physicsBody?.categoryBitMask = PhysicsBitmask.interceptor
        physicsBody?.contactTestBitMask = PhysicsBitmask.enemy
        physicsBody?.collisionBitMask = PhysicsBitmask.none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
