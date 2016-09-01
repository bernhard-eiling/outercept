//
//  Interceptor.swift
//  outercept
//
//  Created by Bernhard Eiling on 21.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class InterceptorNode: SKNode {
    
    let gun = SKSpriteNode(texture: nil, color: UIColor.yellow, size: CGSize(width: 4, height: 50))
    private let body = SKSpriteNode(texture: SKTexture(imageNamed: "Spaceship"), color: UIColor.blue, size: CGSize(width: 30, height: 30))

    private var interceptorPhysicsBody: SKPhysicsBody? {
        let interceptorPhysicsBody = SKPhysicsBody(circleOfRadius: 70)
        interceptorPhysicsBody.categoryBitMask = PhysicsBitmask.interceptor
        interceptorPhysicsBody.contactTestBitMask = PhysicsBitmask.enemy
        interceptorPhysicsBody.collisionBitMask = PhysicsBitmask.none
        return interceptorPhysicsBody
    }
        
    override init() {
        super.init()
        physicsBody = interceptorPhysicsBody
        name = "interceptor"
        gun.zPosition = 1
        body.zPosition = 0
        addChild(body)
        addChild(gun)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
