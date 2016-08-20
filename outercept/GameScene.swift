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
    
    let strokeCollection = StrokeCollection()
    var currentStrokeNode: StrokeNode?
   
    override func didMove(to view: SKView) {

    }
    
    func touchDown(atPoint point : CGPoint) {
        currentStrokeNode = StrokeNode(withPoint: point)
        addChild(currentStrokeNode!)
    }
    
    func touchMoved(toPoint point : CGPoint) {
        currentStrokeNode?.addPoint(point: point)
    }
    
    func touchUp(atPoint point : CGPoint) {
        guard let currentStrokeNode = currentStrokeNode,
        let path = currentStrokeNode.path else { return }
        let spriteNode = SKSpriteNode(imageNamed: "Spaceship")
        addChild(spriteNode)
        spriteNode.scale(to: CGSize(width: 30, height: 30))
        let followAction = SKAction.follow(path, speed: 200)
        spriteNode.run(followAction)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
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
