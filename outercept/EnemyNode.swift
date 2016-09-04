//
//  Enemy.swift
//  outercept
//
//  Created by Bernhard Eiling on 25.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class EnemyNode: SKSpriteNode {
    
    private let maxHealth = 2
    private var health: Int
    private let takeDamageAction: SKAction
    private let baseSpeed: UInt32 = 10
    private let speedVariance: UInt32 = 4
    
    private var enemyPhysicsBody: SKPhysicsBody {
        let physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        physicsBody.categoryBitMask = PhysicsBitmask.enemy
        physicsBody.contactTestBitMask = PhysicsBitmask.interceptor
        physicsBody.collisionBitMask = PhysicsBitmask.none
        physicsBody.isDynamic = false
        return physicsBody
    }
    
    init(withSceneSize sceneSize: CGSize) {
        takeDamageAction = SKAction.sequence([
            SKAction.fadeAlpha(to: 0.5, duration: TimeInterval(0.05)),
            SKAction.fadeAlpha(to: 1.0, duration: TimeInterval(0.05))
            ])
        health = maxHealth
        super.init(texture: SKTexture(image: UIImage.circle(withDiameter: 30, andColor: UIColor.red)), color: UIColor.red, size: CGSize(width: 30, height: 30))
        name = "enemy"
        let randomStartPosition = CGPoint.randomStartPosition(aroundSize: sceneSize)
        position = randomStartPosition
        physicsBody = enemyPhysicsBody
        let moveToMotherShipAction = SKAction.move(to: CGPoint(x: sceneSize.width / 2, y: sceneSize.height / 2), duration: Double(arc4random_uniform(speedVariance) + baseSpeed))
        run(moveToMotherShipAction)
    }
    
    func takeDamage(damage: Int) -> Bool {
        run(takeDamageAction)
        health -= damage
        if health <= 0 { 
            return true
        }
        return false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
