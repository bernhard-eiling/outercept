//
//  Interceptor.swift
//  outercept
//
//  Created by Bernhard Eiling on 21.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class InterceptorNode: SKNode, Gunship {
    
    private let fireRate = 0.3
    private let shotSpeed = 10.0 // seconds to cross diameter of scene
    private let fireRadius: CGFloat = 75
    private let bodySize = CGSize(width: 30, height: 30)
    private let gunSize = CGSize(width: 4, height: 13)
    private let gunRangeIndicatorColor = UIColor(colorLiteralRed: 0.1, green: 0.3, blue: 1.0, alpha: 0.1)
    
    private let gun: SKSpriteNode
    private let body: SKSpriteNode
    private var shots: [ShotNode] = []
    private weak var gunFollowNode: SKNode?
    
    private var fireTimer: Timer?

    private var interceptorPhysicsBody: SKPhysicsBody? {
        let interceptorPhysicsBody = SKPhysicsBody(circleOfRadius: fireRadius)
        interceptorPhysicsBody.categoryBitMask = PhysicsBitmask.interceptor
        interceptorPhysicsBody.contactTestBitMask = PhysicsBitmask.enemy
        interceptorPhysicsBody.collisionBitMask = PhysicsBitmask.none
        return interceptorPhysicsBody
    }
        
    override init() {
        gun = SKSpriteNode(texture: nil, color: UIColor.yellow, size: gunSize)
        body = SKSpriteNode(texture: SKTexture(imageNamed: "Spaceship"), color: UIColor.blue, size: bodySize)
        let gunRangeIndicatorImage = UIImage.circle(withDiameter: fireRadius * 2, andColor: gunRangeIndicatorColor)
        let gunRangeIndicator = SKSpriteNode(texture: SKTexture(image: gunRangeIndicatorImage))
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
    
    func shootGun(atNode node: SKNode) {
        let gunOrientation = SKConstraint.orient(to: node, offset: SKRange(constantValue: CGFloat(-M_PI_2)))
        gunFollowNode = node
        gun.constraints = [gunOrientation]
        fireTimer?.invalidate()
        fireTimer = Timer.scheduledTimer(withTimeInterval: fireRate, repeats: true, block: { _ in
            guard let scene = self.scene else { return }
            if self.gunFollowNode?.scene == nil {
                self.resetGun()
                return
            }
            let shot = ShotNode(withGunship: self, andLifetime: self.shotSpeed)
            let sceneDiameter = CGVector(dx: scene.size.width, dy: scene.size.height).length()
            let gunDirection = CGVector.vector(fromRadians: self.gun.zRotation)
            let globalGunDirection = gunDirection.rotated(byRadians: self.zRotation)
            let targetVector = globalGunDirection.vector(withLength: sceneDiameter)
            let targetPosition = self.position + targetVector.point
            shot.position = self.position
            shot.zRotation = globalGunDirection.radians()
            let moveAction = SKAction.move(to: targetPosition, duration: TimeInterval(self.shotSpeed))
            self.scene?.addChild(shot)
            shot.run(moveAction)
        })
    }
    
    func resetGun() {
        fireTimer?.invalidate()
        gun.constraints = nil
        gun.zRotation = 0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
