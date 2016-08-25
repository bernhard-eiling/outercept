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
    
    var interceptionCollection: InterceptionCollection?
    var currentInterceptionSubtree: InterceptionSubtree?
    
    override func didMove(to view: SKView) {
        interceptionCollection = InterceptionCollection(withScene: self)
    }
    
    func touchDown(atPoint point : CGPoint) {
        currentInterceptionSubtree = InterceptionSubtree(withStartPoint: point)
        interceptionCollection?.addNode(interceptionSubtree: currentInterceptionSubtree!)
    }
    
    func touchMoved(toPoint point : CGPoint) {
        currentInterceptionSubtree?.add(point: point)
    }
    
    func touchUp(atPoint point : CGPoint) {
        currentInterceptionSubtree?.startInterceptor()
    }
    
    override func update(_ currentTime: TimeInterval) {
        interceptionCollection?.update()
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
