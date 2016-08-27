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
    }
    
    func setup() {
        for enemy in enemies {
            addChild(enemy)
            enemy.reset()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
