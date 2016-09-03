//
//  CGPointExtensions.swift
//  outercept
//
//  Created by Bernhard Eiling on 03.09.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import CoreGraphics

extension CGPoint {
    
    var vector: CGVector {
        return CGVector(dx: x, dy: y)
    }
    
    static func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }
    
}
