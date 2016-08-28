//
//  InterceptionContainer.swift
//  outercept
//
//  Created by Bernhard Eiling on 21.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class Interception: SKNode {
    
    private let strokeNode: StrokeNode
    
    init(withStartPoint startPoint: CGPoint) {
        strokeNode = StrokeNode(withPoint: startPoint)
        super.init()
        name = "interception"
        addChild(strokeNode)
    }
    
    func startInterceptor() {
        let interceptorNode = InterceptorNode()
        addChild(interceptorNode)
        let followAction = SKAction.follow(strokeNode.path!, speed: 150)
        interceptorNode.run(followAction, completion: {
            self.removeFromParent()
        })
    }
    
    func add(point: CGPoint) {
        strokeNode.addPoint(point: point)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
