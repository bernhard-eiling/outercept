//
//  EnemyCollection.swift
//  outercept
//
//  Created by Bernhard Eiling on 25.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class EnemyLayer: SKNode {
    
    let enemies: [EnemyNode]
    
    override init() {
        enemies = [EnemyNode(), EnemyNode(), EnemyNode()]
        super.init()
        for enemy in enemies {
            
            enemy.position = CGPoint(x: 100, y: 100)
//            randomStartPosition()
            
            addChild(enemy)
        }
    }
    
    private func randomStartPosition() -> CGPoint? {
        if arc4random() % 2 == 0 {
            // TODO: variable height
//            scene.size.width
        } else {
            // TODO: variable width
        }
        return nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
