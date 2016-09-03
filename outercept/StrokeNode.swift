//
//  StrokeNode.swift
//  outercept
//
//  Created by Bernhard Eiling on 20.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import SpriteKit

class StrokeNode: SKShapeNode {
    
    private let maxLength: CGFloat = 350
    private var currentLength: CGFloat = 0
    
    init(withPoint point: CGPoint) {
        super.init()
        let path = CGMutablePath()
        path.moveTo(nil, x: point.x, y: point.y)
        self.path = path
    }

    func addPoint(point: CGPoint) {
        guard let mutablePath = path as! CGMutablePath? else { return }
        let nextVector = CGVector.vector(fromPoint: mutablePath.currentPoint, toPoint: point)
        let nextVectorLength = nextVector.length()
        var newLinePoint = point
        if currentLength + nextVectorLength < maxLength { // stroke under max length
            currentLength += nextVectorLength
        } else { // stroke over max length
            let lengthToMax = maxLength - currentLength
            let vectorToMax = nextVector.vector(withLength: lengthToMax)
            newLinePoint = CGPoint(x: vectorToMax.dx + mutablePath.currentPoint.x, y: vectorToMax.dy + mutablePath.currentPoint.y)
            currentLength += lengthToMax
        }
        mutablePath.addLineTo(nil, x: newLinePoint.x, y: newLinePoint.y)
        path = mutablePath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
