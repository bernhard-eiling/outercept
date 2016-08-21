//
//  Interceptor.swift
//  outercept
//
//  Created by Bernhard Eiling on 21.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class InterceptorNode: SKSpriteNode {
    
    let endPosition: CGPoint
    
    init(withEndPosition position: CGPoint) {
        let texture = SKTexture(imageNamed: "Spaceship")
        let size = CGSize(width: 30, height: 30)
        endPosition = position
        super.init(texture: texture, color: UIColor.blue, size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
