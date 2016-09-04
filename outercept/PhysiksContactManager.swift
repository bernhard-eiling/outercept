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
    static let mothership: UInt32 = 0b11
    static let asteriod: UInt32 = 0b100
    static let shot: UInt32 = 0b101
}

class PhysiksContactManager: NSObject, SKPhysicsContactDelegate {
    
    private let scene: SKScene
    
    init(withScene scene: SKScene) {
        self.scene = scene
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if let enemy = contact.bodyB.node as? EnemyNode,
            contact.bodyA.node is MothershipNode  {
            enemy.removeFromParent()
            let newEnemy = EnemyNode(withSceneSize: scene.size)
            scene.addChild(newEnemy)
        }
        if let enemy = contact.bodyA.node as? EnemyNode,
            let interceptor = contact.bodyB.node as? InterceptorNode {
            interceptor.shootGun(atNode: enemy)
        }
        if let enemy = contact.bodyA.node as? EnemyNode,
            let shot = contact.bodyB.node as? ShotNode {
            let destroyed = enemy.takeDamage(damage: shot.damage)
            if destroyed {
                shot.gunship.resetGun()
                enemy.removeFromParent()
                let newEnemy = EnemyNode(withSceneSize: scene.size)
                scene.addChild(newEnemy)
            }
            shot.removeFromParent()
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        if let interceptor = contact.bodyB.node as? InterceptorNode,
            contact.bodyA.node is EnemyNode {
            interceptor.resetGun()
        }
    }
    
}
