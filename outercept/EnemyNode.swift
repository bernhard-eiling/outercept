//
//  Enemy.swift
//  outercept
//
//  Created by Bernhard Eiling on 25.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class EnemyNode: SKSpriteNode {
    
    private var enemyPhysicsBody: SKPhysicsBody {
        let physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        physicsBody.categoryBitMask = PhysicsBitmask.enemy
        physicsBody.contactTestBitMask = PhysicsBitmask.interceptor
        physicsBody.collisionBitMask = PhysicsBitmask.none
        physicsBody.isDynamic = false
        return physicsBody
    }
    
    init() {
        let size = CGSize(width: 30, height: 30)
        super.init(texture: SKTexture(image: UIImage.circle(withDiameter: 30, andColor: UIColor.red)), color: UIColor.red, size: size)
        name = "enemy"
    }
    
    func reset() {
        guard let moveToCenterAction = moveToCenterAction(),
            let randomStartPosition = randomStartPosition() else { return }
        physicsBody = nil
        removeAllActions()
        position = randomStartPosition
        physicsBody = enemyPhysicsBody
        run(moveToCenterAction)
    }
    
    private func randomStartPosition() -> CGPoint? {
        guard let scene = scene else { return nil }
        var x: CGFloat
        var y: CGFloat
        if Bool.random {
            x = Bool.random ? -frame.size.width : scene.size.width + frame.size.width
            y = CGFloat(arc4random_uniform(UInt32(scene.size.height)))
        }
        else {
            x = CGFloat(arc4random_uniform(UInt32(scene.size.width)))
            y = Bool.random ? -frame.size.height : scene.size.height + frame.size.height
        }
        return CGPoint(x: x, y: y)
    }
    
    private func moveToCenterAction() -> SKAction? {
        guard let scene = scene else { return nil }
        let randomTimeInterval = Double(arc4random_uniform(2) + 8)
        let center = CGPoint(x: scene.frame.width / 2, y: scene.frame.height / 2)
        return SKAction.move(to: center, duration: randomTimeInterval)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
