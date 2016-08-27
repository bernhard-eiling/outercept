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
    var interceptorNode: InterceptorNode?
    
    var isInterceptionFinished: Bool {
        guard let interceptor = interceptorNode else { return false }
        return interceptor.frame.contains(interceptor.endPosition)
    }
    
    init(withStartPoint startPoint: CGPoint) {
        strokeNode = StrokeNode(withPoint: startPoint)
        super.init()
        addChild(strokeNode)
    }
    
    func startInterceptor() {
        guard let currentPoint = strokeNode.path?.currentPoint else { return }
        interceptorNode = InterceptorNode(withEndPosition: currentPoint)
        addChild(interceptorNode!)
        let followAction = SKAction.follow(strokeNode.path!, speed: 150)
        interceptorNode!.run(followAction)
    }
    
    func add(point: CGPoint) {
        strokeNode.addPoint(point: point)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
