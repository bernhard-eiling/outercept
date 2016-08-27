//
//  CGVectorExtensions.swift
//  outercept
//
//  Created by Bernhard Eiling on 21.08.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import CoreGraphics

extension CGVector {
    
    static func vector(fromPoint firstPoint: CGPoint, andPoint secondPoint: CGPoint) -> CGVector {
        return CGVector(dx: secondPoint.x - firstPoint.x, dy: secondPoint.y - firstPoint.y)
    }
    
    func length() -> CGFloat {
        return sqrt(abs(dx) * abs(dy))
    }
    
}
