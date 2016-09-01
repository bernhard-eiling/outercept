//
//  AsteroidNode.swift
//  outercept
//
//  Created by Bernhard Eiling on 27.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class AsteroidNode: SKSpriteNode {
    
    private var asteroidPhysicsBody: SKPhysicsBody {
        let physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        physicsBody.categoryBitMask = PhysicsBitmask.asteriod
        physicsBody.contactTestBitMask = PhysicsBitmask.interceptor
        physicsBody.collisionBitMask = PhysicsBitmask.none
        physicsBody.isDynamic = false
        return physicsBody
    }
    
    init() {
        let size = CGSize(width: 60, height: 60)
        super.init(texture: nil, color: UIColor.brown, size: size)
        name = "asteroid"
    }
    
    func reset() {
        guard let moveToBottomAction = moveToBottomAction(),
            let randomStartPosition = randomStartPosition() else { return }
        physicsBody = nil
        removeAllActions()
        position = randomStartPosition
        physicsBody = asteroidPhysicsBody
        run(moveToBottomAction)
    }
    
    private func randomStartPosition() -> CGPoint? {
        guard let scene = scene else { return nil }
        let x = CGFloat(arc4random_uniform(UInt32(scene.size.width)))
        return CGPoint(x: x, y: frame.size.height)
    }
    
    private func moveToBottomAction() -> SKAction? {
        guard let scene = scene else { return nil }
        let randomTimeInterval = Double(arc4random_uniform(10) + 40)
        let x = CGFloat(arc4random_uniform(UInt32(scene.size.width)))
        let y = 0 - frame.size.height
        let bottom = CGPoint(x: x, y: y)
        return SKAction.move(to: bottom, duration: randomTimeInterval)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
