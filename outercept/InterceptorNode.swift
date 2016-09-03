//
//  Interceptor.swift
//  outercept
//
//  Created by Bernhard Eiling on 21.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class InterceptorNode: SKNode {
    
    private let fireRate = 0.3
    private let shotSpeed = 10.0 // seconds to cross diameter of scene
    private let fireDiameter: CGFloat = 150
    private let bodySize = CGSize(width: 30, height: 30)
    private let gunSize = CGSize(width: 4, height: 133)
    private let gunRangeIndicatorColor = UIColor(colorLiteralRed: 0.1, green: 0.3, blue: 1.0, alpha: 0.1)
    
    private let gun: SKSpriteNode
    private let body: SKSpriteNode
    private let shot: ShotNode
    private var shots: [ShotNode] = []
    
    private var fireTimer: Timer?

    private var interceptorPhysicsBody: SKPhysicsBody? {
        let interceptorPhysicsBody = SKPhysicsBody(circleOfRadius: fireDiameter)
        interceptorPhysicsBody.categoryBitMask = PhysicsBitmask.interceptor
        interceptorPhysicsBody.contactTestBitMask = PhysicsBitmask.enemy
        interceptorPhysicsBody.collisionBitMask = PhysicsBitmask.none
        return interceptorPhysicsBody
    }
    
    deinit {
        fireTimer?.invalidate()
    }
        
    override init() {
        gun = SKSpriteNode(texture: nil, color: UIColor.yellow, size: gunSize)
        body = SKSpriteNode(texture: SKTexture(imageNamed: "Spaceship"), color: UIColor.blue, size: bodySize)
        let gunRangeIndicatorImage = UIImage.circle(withDiameter: fireDiameter, andColor: gunRangeIndicatorColor)
        let gunRangeIndicator = SKSpriteNode(texture: SKTexture(image: gunRangeIndicatorImage))
        shot = ShotNode(lifetime: shotSpeed)
        super.init()
        physicsBody = interceptorPhysicsBody
        name = "interceptor"
        gun.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        gun.zPosition = 2
        body.zPosition = 1
        gunRangeIndicator.zPosition = 0
        addChild(body)
        addChild(gun)
        addChild(gunRangeIndicator)
    }
    
    func gun(followsNode node: SKNode) {
        let gunOrientation = SKConstraint.orient(to: node, offset: SKRange(constantValue: CGFloat(-M_PI_2)))
        gun.constraints = [gunOrientation]
        fireGun(atNode: node)
    }
    
    func resetGun() {
        fireTimer?.invalidate()
        gun.constraints = nil
        gun.zRotation = 0
    }

    private func fireGun(atNode node: SKNode) {
        fireTimer = Timer.scheduledTimer(withTimeInterval: fireRate, repeats: true, block: { _ in
            guard let scene = self.scene else { return }
            let shot = ShotNode(lifetime: self.shotSpeed)
            let sceneDiameter = CGVector(dx: scene.size.width, dy: scene.size.height).length()
            let gunDirection = CGVector.vector(fromRadians: self.gun.zRotation)
            let globalGunDirection = gunDirection.rotated(byRadians: self.zRotation)
            let targetVector = globalGunDirection.vector(withLength: sceneDiameter)
            let targetPosition = self.position + targetVector.point
            shot.position = self.position
            let moveAction = SKAction.move(to: targetPosition, duration: TimeInterval(self.shotSpeed))
            self.scene?.addChild(shot)
            shot.run(moveAction)
        })
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
