//
//  MothershipNode.swift
//  outercept
//
//  Created by Bernhard Eiling on 27.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class MothershipNode: SKSpriteNode {
    
    init() {
        let size = CGSize(width: 50, height: 80)
        super.init(texture: nil, color: UIColor.white, size: size)
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.categoryBitMask = PhysicsBitmask.mothership
        physicsBody?.contactTestBitMask = PhysicsBitmask.enemy
        physicsBody?.collisionBitMask = PhysicsBitmask.none
    }
    
    func setup() {
        guard let scene = scene else { return }
        position = CGPoint(x: scene.frame.width / 2, y: scene.frame.height / 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
