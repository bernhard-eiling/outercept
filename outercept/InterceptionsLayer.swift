//
//  StrokeCollection.swift
//  outercept
//
//  Created by Bernhard Eiling on 20.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class InterceptionsLayer: SKNode {

    var interceptions: [Interception] = []
    let maxNumber: Int = 3

    func addNode(interception: Interception) {
        guard interceptions.count < maxNumber else { return }
        interceptions.append(interception)
        addChild(interception)
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
