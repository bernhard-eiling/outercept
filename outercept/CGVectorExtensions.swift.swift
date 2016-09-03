//
//  CGVectorExtensions.swift
//  outercept
//
//  Created by Bernhard Eiling on 21.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import CoreGraphics

extension CGVector {
    
    var point: CGPoint {
        return CGPoint(x: dx, y: dy)
    }
    
    static func vector(fromPoint firstPoint: CGPoint, toPoint secondPoint: CGPoint) -> CGVector {
        return CGVector(dx: secondPoint.x - firstPoint.x, dy: secondPoint.y - firstPoint.y)
    }
    
    static func vector(fromRadians radians: CGFloat) -> CGVector {
        let offsetRadians = radians + CGFloat(M_PI_2)
        return CGVector(dx: cos(offsetRadians), dy: sin(offsetRadians))
    }

    func vector(withLength targetlength: CGFloat) -> CGVector {
        let scale = targetlength / length()
        return multiply(by: scale)
    }
    
    static func + (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx + right.dx, dy: left.dy + right.dy)
    }
    
    func multiply(by factor: CGFloat) -> CGVector {
        return CGVector(dx: dx * factor, dy: dy * factor)
    }
    
    func rotated(byRadians radians: CGFloat) -> CGVector {
        let x = cos(radians)
        let y = sin(radians)
        let newDx = dx * x - dy * y
        let newDy = dx * y + dy * x
        return CGVector(dx: newDx, dy: newDy)
    }
    
    func length() -> CGFloat {
        return sqrt(dx * dx + dy * dy)
    }
    
    func radians() -> CGFloat {
        return atan2(dy, dx)
    }
    
}
