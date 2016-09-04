//
//  GameScene.swift
//  outercept
//
//  Created by Bernhard Eiling on 11.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let physicsContactManager = PhysiksContactManager()
    var currentInterception: Interception?
    let mothership = MothershipNode()
    let maxNumberInterceptions = 3
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = physicsContactManager
        anchorPoint = CGPoint(x: 0, y: 0)
        
        addChild(mothership)
        mothership.setup()
        
        for _ in 0...4 {
            let enemy = EnemyNode()
            addChild(enemy)
            enemy.reset()
        }
        
//        for _ in 0...10 {
//            let asteroid = AsteroidNode()
//            addChild(asteroid)
//            asteroid.reset()
//        }
    }
    
    func touchDown(atPoint point : CGPoint) {
        if mothership.contains(point) {
            let currentNumberInterceptions = self["interception"].count
            guard currentNumberInterceptions < maxNumberInterceptions else { return }
            currentInterception = Interception(withStartPoint: point)
            addChild(currentInterception!)
        }
    }
    
    func touchMoved(toPoint point : CGPoint) {
        currentInterception?.add(point: point)
    }
    
    func touchUp(atPoint point : CGPoint) {
        currentInterception?.startInterceptor()
        currentInterception = nil
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }

}
