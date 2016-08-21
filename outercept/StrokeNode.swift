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
    let maxLenght: CGFloat = 350
    var currentLenght: CGFloat = 0
    
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
        guard let mutablePath = path as! CGMutablePath? else { return }
        let nextVector = CGVector.vector(fromPoint: mutablePath.currentPoint, andPoint: point)
        let nextVectorLength = nextVector.length()
        guard currentLenght + nextVectorLength < maxLenght else { return }
        currentLenght += nextVectorLength
        mutablePath.addLineTo(nil, x: point.x, y: point.y)
        path = mutablePath
    }
}
