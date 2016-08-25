//
//  StrokeCollection.swift
//  outercept
//
//  Created by Bernhard Eiling on 20.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class InterceptionCollection {
    
    var interceptions: [InterceptionSubtree] = []
    let maxNumber: Int = 3
    let scene: SKScene
    
    init(withScene scene: SKScene) {
        self.scene = scene
    }
    
    func addNode(interceptionSubtree: InterceptionSubtree) {
        guard interceptions.count < maxNumber else { return }
        interceptions.append(interceptionSubtree)
        scene.addChild(interceptionSubtree)
    }
    
    func update() {
        interceptions = interceptions.filter { (interception) -> Bool in
            if interception.isInterceptionFinished {
                interception.removeFromParent()
            }
            return !interception.isInterceptionFinished
        }
    }
}
