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
}

class PhysiksContactManager: NSObject, SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        if nodeA is MothershipNode && nodeB is EnemyNode {
            let enemyNode = nodeB as! EnemyNode
            enemyNode.reset()
        }
        if nodeA is EnemyNode && nodeB is InterceptorNode {
            let enemyNode = nodeA as! EnemyNode
            let interceptor = nodeB as! InterceptorNode
            let gunOrientation = SKConstraint.orient(to: enemyNode, offset: SKRange(constantValue: CGFloat(M_2_PI*7)))
            interceptor.gun.constraints = [gunOrientation]
//            enemyNode.reset()
        }
    }
    
}
