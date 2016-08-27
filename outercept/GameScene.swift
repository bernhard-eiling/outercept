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
    
    let interceptionsLayer = InterceptionsLayer()
    let physicsContactManager = PhysiksContactManager()
    var enemyLayer = EnemyLayer()
    var currentInterception: Interception?
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = physicsContactManager
        addChild(interceptionsLayer)
        addChild(enemyLayer)
    }
    
    func touchDown(atPoint point : CGPoint) {
        currentInterception = Interception(withStartPoint: point)
        interceptionsLayer.addNode(interception: currentInterception!)
    }
    
    func touchMoved(toPoint point : CGPoint) {
        currentInterception?.add(point: point)
    }
    
    func touchUp(atPoint point : CGPoint) {
        currentInterception?.startInterceptor()
    }
    
    override func update(_ currentTime: TimeInterval) {
        interceptionsLayer.update()
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
