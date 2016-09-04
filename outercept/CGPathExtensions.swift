//
//  CGPathExtensions.swift
//  outercept
//
//  Created by Bernhard Eiling on 04.09.16.
//  Copyright © 2016 bernhardeiling.com. All rights reserved.
//

import CoreGraphics

extension CGPath {
    
    static func randomLeadingToCenterPath(fromSize size: CGSize) -> CGPath {
        let randomStartPosition = CGPoint.randomStartPosition(aroundSize: size)
        let path = CGMutablePath()
        path.moveTo(nil, x: randomStartPosition.x, y: randomStartPosition.y)
        path.addLineTo(nil, x: size.width / 2, y: size.height / 2)
        return path
    }
    
}
