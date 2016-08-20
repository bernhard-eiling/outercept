//
//  StrokeNode.swift
//  outercept
//
//  Created by Bernhard Eiling on 20.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class StrokeNode: SKShapeNode {
    
    let startPoint: CGPoint
    
    init(withPoint point: CGPoint) {
        startPoint = point
        super.init()
        let path = CGMutablePath()
        path.moveTo(nil, x: point.x, y: point.y)
        self.path = path
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPoint(point: CGPoint) {
        if let path = self.path as! CGMutablePath? {
            path.addLineTo(nil, x: point.x, y: point.y)
            self.path = path
        }
    }
}
