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
    
    static func randomStartPosition(aroundSize size: CGSize) -> CGPoint {
        var x: CGFloat
        var y: CGFloat
        if Bool.random {
            x = Bool.random ? 0 : size.width
            y = CGFloat(arc4random_uniform(UInt32(size.height)))
        }
        else {
            x = CGFloat(arc4random_uniform(UInt32(size.width)))
            y = Bool.random ? 0 : size.height
        }
        return CGPoint(x: x, y: y)
    }
    
}
